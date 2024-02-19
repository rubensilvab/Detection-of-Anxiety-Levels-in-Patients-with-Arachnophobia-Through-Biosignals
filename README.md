# Detection of Anxiety Levels in Patients with Arachnophobia Through Biosignals

## Motivation

Soren Kierkegaard's "The Concept of Anxiety" laid the groundwork for understanding anxiety in the 19th century. Initially viewed as a positive impulse towards ethical choices, anxiety is now recognized as a natural response to stress. However, excessive and prolonged anxiety can lead to disorders, prevalent in Portugal and worldwide. Arachnophobia, an irrational fear of spiders, is one such anxiety disorder. Symptoms include increased heart rate, sweating, trembling, and difficulty breathing. Treatment often involves exposure therapy, gradually exposing patients to feared objects. Our study focuses on monitoring anxiety levels during exposure therapy sessions for arachnophobia patients, using biosignals like ECG, GSR, and BR. 

## Goals

- Processing electrocardiograms (ECGs), galvanic skin responses (GSRs), and breathing rates (BRs) extracted from 2 arachnophobia patients exposed to 16 spider videos.
- Studying the anxiety levels provoked by each video in the patients.
- Finally, based on the study of anxiety levels, it is imperative to conclude which spider video most alters the patients' anxiety levels.

## Methods

### Dataset

The database used in our project consists of data from a study conducted by 5 Germans, who monitored the ECG, GSR, and BR of 80 arachnophobia patients during an exposure therapy session. Biosignals were captured using Bitalino wearable devices, with a sampling frequency of 100Hz. During each session, patients wore the devices while the authors monitored their psychophysiological data, engaged in a brief conversation, showed a 1-minute spider-free demo video, then randomly projected 16 one-minute spider videos, followed by 5 minutes of relaxation. The database comprises 80 folders, one for each patient, each containing 4 files: ECG values (mV), GSR information (μS), BR data (%), and a "triggers.txt" file with video timestamps.

In the upcoming sections, we'll analyze ECG, GSR, and BR data from patients 3 and 9, applying filters and processing the signals to evaluate anxiety levels induced by each video and determine the most disturbing video for both patients.
