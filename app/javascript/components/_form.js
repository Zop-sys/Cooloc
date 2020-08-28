
// const salon = document.getElementById("Salon")

// const flip = () =>  {
//   salon.addEventListener("click", (event) => {
//     event.currentTarget.classList.toggle("flipped");
//   })
// };

const roomCards = document.querySelectorAll('.turn');
console.log(roomCards);
const flip = () =>  { roomCards.forEach((roomCard) => {
  roomCard.addEventListener('click', (event) => {
    event.currentTarget.classList.toggle("flipped");
    event.currentTarget.classList.toggle("hidden");
    event.currentTarget.classList.toggle("flipped");
  });
});
};
export { flip };
