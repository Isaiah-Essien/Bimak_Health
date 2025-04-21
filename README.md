# Bimak Health App

**Bimak** is a mobile health assistant app developed during the Meta AI Symposium Hackathon. It helps users detect brain tumors from MRI images using a Convolutional Neural Network (CNN) model. The app provides fast, AI-powered screening to assist in early diagnosis and healthcare accessibility.

---

##  Features

- **Brain Tumor Detection**: Upload brain MRI images and get instant predictions powered by a trained CNN model.
- **Mobile Accessibility**: Easy-to-use interface for non-technical users to interact with AI diagnostics.
- **Fast Inference**: Lightweight and optimized backend for real-time image classification.

---

## ⚙️ Tech Stack

| Layer          | Technology              |
|----------------|--------------------------|
| **Frontend**   | Flutter, Dart            |
| **ML Model**   | Convolutional Neural Network (CNN) |
| **Backend**    | FastAPI or Flask (to serve model predictions) |
| **State Mgmt** | Provider / Bloc (Flutter) |

---

##  How It Works

1. **User Uploads MRI Image**: The app provides options to upload or capture brain MRI scans.
2. **CNN Model Processes Image**: Image is sent to the backend where the CNN model classifies it as 'Tumor' or 'No Tumor'.
3. **Prediction Returned**: Results are displayed on the mobile interface along with confidence scores.
4. - **AI Health Assistant**: Ask health-related questions and get accurate responses powered by a fine-tuned LLaMA 3.0 model.

---

## 🛠 Installation

```
git clone https://github.com/yourusername/bimak-health-app.git
cd bimak-health-app
flutter pub get
flutter run
```
## Acknowledgement 
- Meta AI Symposium 2024 Hackathon

- African Leadership University

- Brain MRI Dataset (e.g., Kaggle or public medical repository)
