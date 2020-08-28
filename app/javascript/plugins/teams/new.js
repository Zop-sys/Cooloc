const initAddRoomateEmailInput = () => {
  const roomateEmails = document.getElementById("roomate-emails");
  const addRoomateBtn = document.getElementById('add-roomate-btn-js');

  if (addRoomateBtn) {
    // Ecouter le click
    addRoomateBtn.addEventListener('click', (event) => {
      // Prevent default
      event.preventDefault();
      // ajouter le html input "mail du coloc"
      const removeEmailId = `remove_roomate_email_${roomateEmails.childElementCount + 1}`
      const emailInput = `
        <div class="inputteam devise_new mb-2">
          <input type="text" name="roomate_emails[]" id="roomate_emails_${roomateEmails.childElementCount + 1}">
          <i class="far fa-trash-alt ml-2 text-danger" id="${removeEmailId}"></i>
        </div>
      `
      roomateEmails.insertAdjacentHTML('beforeend', emailInput);
      document.getElementById(removeEmailId).addEventListener('click', (event) => {
        event.stopPropagation();
        event.preventDefault();
        event.currentTarget.parentElement.remove();
      });
    });
  }
};

export { initAddRoomateEmailInput };
