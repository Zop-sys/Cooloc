
const roomCards = document.querySelectorAll('.card_task');
console.log(roomCards);
const flip = () =>  {
  roomCards.forEach((roomCard) => {
    roomCard.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle("flipped");

    });
  });
};
export { flip };
