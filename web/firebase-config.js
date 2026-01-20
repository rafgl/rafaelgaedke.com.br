// Firebase configuration
const firebaseConfig = {
  apiKey: "your-api-key",
  authDomain: "your-project.firebaseapp.com",
  projectId: "your-project-id",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "your-sender-id",
  appId: "your-app-id",
  measurementId: "your-measurement-id"
};

// Initialize Firebase
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

export { analytics };
