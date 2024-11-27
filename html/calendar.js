const eventData = [
  {
    region: "FestiList_Region_Soeul",
    title: "서울 불꽃축제",
    start: "2024-11-25",
    end: "2024-11-29"
  },
  {
    region: "FestiList_Region_Busan",
    title: "부산 음악 페스티벌",
    start: "2024-11-27",
    end: "2024-11-28"
  }
  // 추가 데이터
];

let currentMonth = new Date();

function renderCalendar(month) {
  const year = month.getFullYear();
  const monthIndex = month.getMonth();
  const firstDay = new Date(year, monthIndex, 1).getDay();
  const lastDate = new Date(year, monthIndex + 1, 0).getDate();

  document.getElementById("current-month").innerText = `${year}년 ${monthIndex +
    1}월`;

  const calendarTable = document.getElementById("calendar");
  calendarTable.innerHTML = `<tr>
        <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
    </tr>`;

  let row = document.createElement("tr");
  for (let i = 0; i < firstDay; i++) {
    row.appendChild(document.createElement("td"));
  }

  for (let date = 1; date <= lastDate; date++) {
    const cell = document.createElement("td");
    const dayNumber = document.createElement("div");
    dayNumber.className = "day-number";
    dayNumber.innerText = date;

    const dateString = `${year}-${String(monthIndex + 1).padStart(
      2,
      "0"
    )}-${String(date).padStart(2, "0")}`;
    eventData
      .filter(
        event => date >= new Date(event.start) && date <= new Date(event.end)
      )
      .forEach(event => {
        const eventDiv = document.createElement("div");
        eventDiv.className = `event ${event.region}`;
        eventDiv.innerText = event.title;
        cell.appendChild(eventDiv);
      });

    cell.appendChild(dayNumber);
    row.appendChild(cell);

    if ((firstDay + date) % 7 === 0) {
      calendarTable.appendChild(row);
      row = document.createElement("tr");
    }
  }
  if (row.children.length > 0) {
    calendarTable.appendChild(row);
  }
}

document.getElementById("prev-month").addEventListener("click", () => {
  currentMonth.setMonth(currentMonth.getMonth() - 1);
  renderCalendar(currentMonth);
});

document.getElementById("next-month").addEventListener("click", () => {
  currentMonth.setMonth(currentMonth.getMonth() + 1);
  renderCalendar(currentMonth);
});
