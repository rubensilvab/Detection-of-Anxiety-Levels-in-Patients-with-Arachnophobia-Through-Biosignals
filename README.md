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

### Electrocardiogram (ECG)

The ECG records electrical activity in the heart. It's crucial for diagnosing cardiac conditions. Normal ECG includes P, QRS, and T waves, representing different heart activities. We can derive heart rate and variability from it, essential for assessing anxiety levels. Processing the ECG signals involves specific steps.

<img width="768" alt="ecg" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/6d462977-9e3d-4dcf-b70c-4c1aa6e83a34">

***Figure 1**- Electrocardiogram*

### Application of the Pan-Tompkins Algorithm Block

To extract BPM and HRV, we apply the Pan-Tompkins algorithm. This algorithm enhances the QRS complex to facilitate signal analysis and extract the aforementioned information. It consists of a cascade of filters, where the output of each filter serves as the input to the next filter.

<img width="1080" alt="pantomp" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/a8a5cb27-7187-4e34-8851-d77543af846d">

***Figure 2**- Pan.Tompkins Algorithm*

It consists of a cascade of filters, as detailed below:

- Low Pass Filter

The filter has a cutoff frequency of approximately 11 Hz and eliminates higher frequencies. However, it was designed for a signal sampled at a frequency of 200 Hz. This filter is of order 100 and has the same cutoff frequency as the previous transfer function.

<img width="1160" alt="hlow" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/e561bdf9-8739-4202-9661-ada52a9c7988">

- High Pass Filter

This filter has a cutoff frequency of around 5 Hz and will cut off all frequencies below 5 Hz. By cascading these filters, we effectively create a bandpass [5-11] Hz, removing frequencies outside this range. This cascade development is beneficial as it reduces the influence of various interferences such as cardiac muscle, 60 Hz electrical network interference, or T-wave interference.

<img width="1172" alt="hhigh" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/ce0670e9-5642-42d3-88d6-df9496b55637">

- Differentiator

Next, the signal from the previous cascade is differentiated to obtain information about the slope of the QRS complex.

<img width="1176" alt="diff" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/4eff7918-39e3-46a4-88fd-12be0e6f5b14">

- Square Function

After differentiation, we square the resulting signal to make it all positive and enhance the higher frequencies (representative of the ECG).

- Moving Average

Finally, we performed the average of N consecutive samples along the obtained signal to obtain information about the waveform together with the slope of the R wave. The window corresponding to N samples must have a length equivalent to the QRS complex (150 ms). With our sampling frequency of 100 Hz, we empirically obtained the value of N=15.

<img width="1184" alt="moviav" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/9bbcbf89-b538-4f14-8223-0bd252f0a6cc">


