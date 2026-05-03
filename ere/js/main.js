document.addEventListener("DOMContentLoaded", () => {
  const sections = document.querySelectorAll(".page-section");
  const navLinks = document.querySelectorAll(".nav-link");
  const form = document.querySelector("#contact-form");
  const successMessage = document.querySelector("#form-success");

  const setActiveSection = (hash) => {
    const targetId = hash ? hash.slice(1) : "home";
    sections.forEach((section) => {
      section.classList.toggle("active-section", section.id === targetId);
    });
    navLinks.forEach((link) => {
      link.classList.toggle("active", link.getAttribute("href") === `#${targetId}`);
    });
  };

  const updateRoute = () => {
    const currentHash = window.location.hash || "#home";
    setActiveSection(currentHash);
  };

  window.addEventListener("hashchange", updateRoute);
  updateRoute();

  if (form) {
    form.addEventListener("submit", (event) => {
      event.preventDefault();
      form.reset();
      if (successMessage) {
        successMessage.classList.remove("d-none");
      }
    });
  }
});