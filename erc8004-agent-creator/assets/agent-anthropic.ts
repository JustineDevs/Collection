/**
 * LLM Agent (Anthropic Claude)
 *
 * This file contains the AI logic for your agent using Anthropic's Claude.
 * Replace the default OpenAI agent when the user requests Claude/Anthropic.
 *
 * Requires: npm install @anthropic-ai/sdk
 * Environment: ANTHROPIC_API_KEY
 */

import Anthropic from "@anthropic-ai/sdk";

const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY,
});

// ============================================================================
// Types
// ============================================================================

export interface AgentMessage {
  role: "user" | "assistant" | "system";
  content: string;
}

// ============================================================================
// Core Functions
// ============================================================================

/**
 * Send messages to the LLM and get a response.
 * Uses Claude Messages API. System message is passed as system prompt; rest as messages.
 */
export async function chat(messages: AgentMessage[]): Promise<string> {
  const system = messages.find((m) => m.role === "system")?.content ?? "";
  const conversation = messages.filter((m) => m.role !== "system");
  const anthropicMessages = conversation.map((m) => ({
    role: m.role === "user" ? "user" : "assistant",
    content: m.content,
  }));

  const response = await anthropic.messages.create({
    model: "claude-sonnet-4-20250514",
    max_tokens: 1024,
    system,
    messages: anthropicMessages,
  });

  const textBlock = response.content.find((block) => block.type === "text");
  return textBlock && "text" in textBlock ? textBlock.text : "No response";
}

/**
 * Generate a response to a user message.
 * Main function called by A2A and MCP handlers.
 */
export async function generateResponse(
  userMessage: string,
  history: AgentMessage[] = []
): Promise<string> {
  const systemPrompt: AgentMessage = {
    role: "system",
    content:
      "You are a helpful AI assistant registered on the ERC-8004 protocol. Be concise and helpful.",
  };

  const messages: AgentMessage[] = [
    systemPrompt,
    ...history,
    { role: "user", content: userMessage },
  ];

  return chat(messages);
}

/**
 * Stream a response (SSE compatibility). Yields one chunk with full response.
 * For true streaming, use Anthropic streaming API and yield tokens.
 */
export async function* streamResponse(
  userMessage: string,
  history: AgentMessage[] = []
): AsyncGenerator<string> {
  const full = await generateResponse(userMessage, history);
  if (full) yield full;
}
