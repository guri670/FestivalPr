// 사이드바 열기
document.getElementById("sidebar-btn").addEventListener("click", () => {
  document.getElementById("sidebar").classList.add("active");
});

// 사이드바 닫기
document.getElementById("sidebar-close-btn").addEventListener("click", () => {
  document.getElementById("sidebar").classList.remove("active");
});

// 사이드바 외부 클릭 시 닫히도록 설정
window.addEventListener("click", e => {
  if (
    !document.getElementById("sidebar").contains(e.target) &&
    !document.getElementById("sidebar-btn").contains(e.target)
  ) {
    document.getElementById("sidebar").classList.remove("active");
  }
});
