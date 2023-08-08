function triggerPartyEffect(checkbox) {
  if (checkbox.checked) {
    party.confetti(document.body, {
      count: 500,
      duration: 5000,
    });
  }
}

document.addEventListener("turbo:load", function () {
  if (window.location.pathname === "/home/special_thanks") {
    party.confetti(document.body, {
      count: 500,
      duration: 5000,
    });
  }
});
