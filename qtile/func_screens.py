# Lazy objects
# https://qtile.readthedocs.io/en/stable/manual/config/lazy.html


def window_name(text):
    for string in [" - Chromium", " - Firefox"]:
        text = text.replace(string, "")
        return text
