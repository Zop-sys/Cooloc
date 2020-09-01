const flipCardEvent = (cardTask) => (event) => {
  cardTask.classList.toggle('flipped');
};

const flip = () =>  {
  const roomCards = document.querySelectorAll('.team-task-card-js');
  roomCards.forEach((roomCard) => {
    const cardTask    = roomCard.querySelector('.card_task');
    const cardImgTop  = roomCard.querySelector('.card_task .card-img-top');
    const cardTitle   = roomCard.querySelector('h3.card-text');
    const returnArrow = roomCard.querySelector('.return-arrow');
    cardImgTop.addEventListener('click', flipCardEvent(cardTask));
    cardTitle.addEventListener('click', flipCardEvent(cardTask));
    returnArrow.addEventListener('click', flipCardEvent(cardTask));
  });
};

export { flip };
