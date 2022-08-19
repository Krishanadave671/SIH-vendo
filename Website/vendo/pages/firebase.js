// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getStorage } from "firebase/storage";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyA4YzrnrjqwhE349d5qUNB7xBZpywUaDFc",
  authDomain: "vendo-35469.firebaseapp.com",
  projectId: "vendo-35469",
  storageBucket: "vendo-35469.appspot.com",
  messagingSenderId: "79338234029",
  appId: "1:79338234029:web:5319a27c2ead6759696624",
  measurementId: "G-078WLFQS4B"
};

// Initialize Firebase
export const app = initializeApp(firebaseConfig);
export const storage = getStorage(app);
