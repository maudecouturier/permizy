import consumer from "./consumer";

const scrollToBottom = element => {
  // eslint-disable-next-line
  element.scrollTop = element.scrollHeight;
};

const messagesContainer = document.getElementById('messages');
if (messagesContainer) {
  const id = messagesContainer.dataset.chatroomId;

  consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
    received(data) {
      console.log(data)
      messagesContainer.insertAdjacentHTML('beforeend', data);
    }
  });
  scrollToBottom(messagesContainer)
  // consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
  //   received(data) {
  //     console.log(data); // called when data is broadcast in the cable
  //   },
  // });
}


