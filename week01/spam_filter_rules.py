"""
MCCTC | 145130 Applications of AI
Week 1: What Is AI, Really?
Demo: A rule-based spam filter and why it breaks.

From the reading:
"This week you will build a spam filter with rules and watch it break.
Next week you will train an AI on the same messages and see what it does differently."
"""

def is_spam(message: str) -> bool:
    """
    Rule-based spam detection function written by a programmer.
    Rule: If the message contains the exact word 'winner', call it spam.
    """
    text = message.lower()
    if "winner" in text:
        return True
    return False


def test_messages():
    messages = [
        ("Congratulations! You are the winner of a $1000 gift card!", True),
        ("Hey, what time are we meeting up for lunch today?", False),
        ("URGENT: Claim your free prize right now, w1nner!", True),      # Rule breaks here!
        ("You have won a free iPhone, claim before midnight!", True),    # Rule breaks here!
        ("The winner of the school science fair was announced.", False),  # False positive!
        ("Don't forget your homework assignment for Monday.", False),
    ]

    print("=" * 65)
    print(" MCCTC 145130: Rule-Based Spam Filter Demonstration")
    print(" Rule: 'if \"winner\" in text: return True'")
    print("=" * 65)

    passed = 0
    total = len(messages)

    for i, (msg, expected_spam) in enumerate(messages, 1):
        actual_spam = is_spam(msg)
        status = "PASSED" if actual_spam == expected_spam else "FAILED (Rule Broken)"
        if actual_spam == expected_spam:
            passed += 1

        print(f"\nMessage {i}: \"{msg}\"")
        print(f"  Expected: {'SPAM' if expected_spam else 'NOT SPAM'}")
        print(f"  Result:   {'SPAM' if actual_spam else 'NOT SPAM'}")
        print(f"  Status:   {status}")

    print("\n" + "=" * 65)
    print(f" Accuracy: {passed}/{total} correct ({(passed/total)*100:.1f}%)")
    print(" Observation:")
    print("  1. 'w1nner' bypassed the filter because nobody wrote a rule for '1'.")
    print("  2. 'won a free iPhone' bypassed it because 'winner' wasn't used.")
    print("  3. 'winner of the school science fair' was flagged as SPAM (false positive).")
    print(" This is why rules are not enough, and why AI learns from examples instead!")
    print("=" * 65)


if __name__ == "__main__":
    test_messages()
