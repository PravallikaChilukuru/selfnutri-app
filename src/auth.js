
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/11.9.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/11.9.1/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyBhEHEgjRhj8NRkP1t4Ua53kcnFxaS5Zp8",
    authDomain: "selfnutriapp.firebaseapp.com",
    projectId: "selfnutriapp",
    storageBucket: "selfnutriapp.firebasestorage.app",
    messagingSenderId: "244812012239",
    appId: "1:244812012239:web:74ff5518334352787575ba",
    measurementId: "G-EMGEHKS4NH"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);