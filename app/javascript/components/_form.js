
const roomCards = document.querySelectorAll('.card_task');
const imgRooms = document.querySelectorAll('.img-rooms');

console.log(imgRoom);
console.log(roomCards);

const flip = () =>  {
  imgRooms.forEach((imgRoom) => {
    imgRoom.addEventListener('click', (event) => {
      event.roomCards.classList.toggle("flipped");

    });
  });
};

export { flip };
