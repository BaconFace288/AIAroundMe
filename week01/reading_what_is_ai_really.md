# What Is AI, Really?
**Applications of AI · Week 1 reading · also the video script**  
*MCCTC | 145130 Applications of AI*

---

## The Big Idea
> **Some programs follow rules a person wrote. AI programs learn from examples instead.**

### Who picked that video?
Open TikTok or YouTube and scroll for one minute. Every video you see was picked for you.

No person picked it. There is no employee watching your account and choosing videos. A computer program did it.

Here is the strange part. Nobody ever told that program "this person likes basketball and cooking videos." It figured that out on its own, by watching what you watch, what you skip, and what you replay.

---

## Programs you already know follow rules
You have written programs for two years. Every one of them worked the same way: you decided exactly what the program should do, and you wrote it down.

Here is a tiny program that decides whether a text message is spam:

```python
def is_spam(message):
    text = message.lower()
    if "winner" in text:
        return True
    return False
```

That is a **rule**: an instruction a person wrote. This one says *"if the message has the word winner in it, call it spam."*

Rules are great because you can always explain them. If this program calls a message spam, you can point to the exact line that did it.

But rules have a problem. They only know what you told them. If a scammer writes `"w1nner"` with a number one, your rule misses it. You did not write a rule for that.

---

## When rules are not enough
Try to write rules for these:
- **Recognizing your face:** What rule describes your face? It looks different in every photo, every light, every angle.
- **Picking your next video:** What rule says you will like this one? Nobody could write it.
- **Understanding what you say to Siri:** Everyone talks differently.

For problems like these, nobody can write the rules. So programmers tried something different.

---

## Learning from examples
Instead of writing rules, you give the computer examples and let it figure out the pattern.

Here is how a computer learns to catch spam:
1. **Collect examples:** Gather thousands of text messages. A person marks each one spam or not spam.
2. **Practice:** The computer looks at a message, makes a guess, then checks the right answer. If it was wrong, it adjusts itself a little.
3. **Repeat thousands of times:** Each round, it gets a little better.
4. **Use it:** Give it a brand new message it has never seen, and it makes a guess.

This is called **machine learning**. It is the most common way to build artificial intelligence (AI).

---

## Words to know

| Word | What it means |
|---|---|
| **Rule** | An instruction a person wrote, like an `if` statement |
| **Artificial intelligence (AI)** | A computer doing something that normally takes human thinking, like recognizing a face |
| **Machine learning** | The computer learns patterns from examples instead of following written rules |
| **Training data** | The examples the computer learns from |
| **Training** | The practice: guess, check, adjust, repeat |
| **Model** | What you have after training: the part that makes guesses |
| **Prediction** | The model's guess about something new |

---

## AI you already use

| App or feature | What it learned from |
|---|---|
| **TikTok and YouTube feeds** | What millions of people watched, skipped, and liked |
| **Face unlock** | Lots of photos of faces, then yours |
| **Autocorrect** | Huge amounts of typed text |
| **Spam filters** | Messages people marked as spam |
| **Snapchat filters** | Photos of faces, to find eyes and mouths |

### Things that are NOT AI (because a person wrote the rules):
- A calculator
- An alarm clock
- Most video game enemies that follow a set path

---

## The one test to remember
When you wonder whether something is AI, ask one question:
> **Did a person write the rules, or did the computer learn them from examples?**

---

## Check yourself (Reading Review)

### 1. In your own words, what is the difference between a rule and machine learning?
A **rule** is a specific instruction explicitly coded by a human programmer (like an `if` condition), so the computer only does exactly what it was told. **Machine learning** means the programmer does not write the rules; instead, the computer analyzes thousands of examples, adjusts its internal weights through trial and error, and discovers the patterns on its own.

### 2. Pick one app on your phone. Is it AI or not? How do you know?
**App:** Spotify  
**Is it AI or not?:** Yes, it is AI.  
**How do you know?:** Its recommendation system (like Discover Weekly) wasn't coded with explicit rules like "if user likes rock, play this exact song." Instead, it learned from millions of playlists, listening habits, and skips across the user base to predict what I will enjoy based on my listening history.

### 3. Why can't a person write rules for recognizing faces?
A person cannot write rules for face recognition because human faces look completely different under varying lighting conditions, shadows, angles, facial expressions, hairstyles, aging, and accessories. There is no mathematical rule (such as pixel color or fixed coordinates) that can describe every possible view of a human face without failing on edge cases.
