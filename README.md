# Detection of Anxiety Levels in Patients with Arachnophobia Through Biosignals

## Motivation

Soren Kierkegaard's "The Concept of Anxiety" laid the groundwork for understanding anxiety in the 19th century. Initially viewed as a positive impulse towards ethical choices, anxiety is now recognized as a natural response to stress. However, excessive and prolonged anxiety can lead to disorders, prevalent in Portugal and worldwide. Arachnophobia, an irrational fear of spiders, is one such anxiety disorder. Symptoms include increased heart rate, sweating, trembling, and difficulty breathing. Treatment often involves exposure therapy, gradually exposing patients to feared objects. Our study focuses on monitoring anxiety levels during exposure therapy sessions for arachnophobia patients, using biosignals like ECG, GSR, and BR. Main code: [ecgpacientes](Project/ecgpacientes.m).
 

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

***Figure 1**- Electrocardiogram and the wave shapes.*

#### Application of the Pan-Tompkins Algorithm Block

To extract BPM and HRV, we apply the Pan-Tompkins algorithm. This algorithm enhances the QRS complex to facilitate signal analysis and extract the aforementioned information. It consists of a cascade of filters, where the output of each filter serves as the input to the next filter. Code: [Pan_Tompkins](Project/filters/Pan_TompkinsDIF.m).


<img width="1080" alt="pantomp" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/a8a5cb27-7187-4e34-8851-d77543af846d">

***Figure 2**- Pan Tompkins Algorithm*

It consists of a cascade of filters, as detailed below:

- Low Pass Filter

The filter has a cutoff frequency of approximately 11 Hz and eliminates higher frequencies. However, it was designed for a signal sampled at a frequency of 200 Hz. This filter is of order 100 and has the same cutoff frequency as the previous transfer function. Code: [Passa_Baixo_ecg](Project/filters/Passa_Baixo_ecg.m).

<img width="1160" alt="hlow" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/e561bdf9-8739-4202-9661-ada52a9c7988">

- High Pass Filter

This filter has a cutoff frequency of around 5 Hz and will cut off all frequencies below 5 Hz. By cascading these filters, we effectively create a bandpass [5-11] Hz, removing frequencies outside this range. This cascade development is beneficial as it reduces the influence of various interferences such as cardiac muscle, 60 Hz electrical network interference, or T-wave interference. Code: [Passa_Alto_ecg](Project/filters/Passa_Alto_ecg_ord100.m).

<img width="1172" alt="hhigh" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/ce0670e9-5642-42d3-88d6-df9496b55637">

- Differentiator

Next, the signal from the previous cascade is differentiated to obtain information about the slope of the QRS complex.

<img width="1176" alt="diff" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/4eff7918-39e3-46a4-88fd-12be0e6f5b14">

- Square Function

After differentiation, we square the resulting signal to make it all positive and enhance the higher frequencies (representative of the ECG).

- Moving Average

Finally, we performed the average of N consecutive samples along the obtained signal to obtain information about the waveform together with the slope of the R wave. The window corresponding to N samples must have a length equivalent to the QRS complex (150 ms). With our sampling frequency of 100 Hz, we empirically obtained the value of N=15.

<img width="1184" alt="moviav" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/9bbcbf89-b538-4f14-8223-0bd252f0a6cc">

#### Calculating the Heart Rate in Beats Per Minute (BPM) and Heart Variability (HRV)

The Pan-Tompkins algorithm successfully enhanced the QRS complex, particularly the R peaks. The findpeaks command detected local maxima, ensuring a minimum distance of 60 samples for patient 3 and 50 for patient 9 to isolate R peaks. Using the peak coordinates, BPM was computed by dividing the total R peaks by their duration in seconds and multiplying by 60. Figure 4 in the appendix illustrates peak detection. HRV, the temporal variation between consecutive R peaks, is calculated by organizing peak times into a matrix and computing the average of their temporal differences.

<img width="1232" alt="picosr" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/d79c42d2-6fda-4af8-ba08-4a1f058b35de">

***Figure 2**- Peak detection for BPM and HRV calculation for patient 3 in video #5.*

### Galvanic Skin Response (GSR)

GSR refers to skin galvanic response, indicating changes in sweat gland activity, which in turn reflects the intensity of our emotional state, known as emotional arousal. The GSR signal does not represent the type of emotion, but its intensity. Significant changes in GSR activity in response to a stimulus are known as GSR peaks. In the GSR extracted from each patient and characteristic of each video clip, calculating the number of GSR peaks and the average of their values (in uS) is of interest.

Before calculating the average GSR peaks and the number of peaks, it is necessary to apply a filter to remove high-frequency noise. The filter used is a second-order Butterworth low-pass filter with a cutoff frequency of 1.5 Hz. The selected order aims to provide optimal signal filtering and protection, based on the literature review conducted by us.

### Breathing rate (BR)

Breathing can also be affected by emotional stimuli and is known as an excellent indicator of anxiety. BR is simply the number of respiratory movements made by an individual per minute. We opted to evaluate the deflection of the piezoelectric sensor integrated into the wearable device and placed on the patient's chest. The higher the absolute value of the BR, the greater the chest deflection movement. We applied a bandpass filter, with cutoff frequencies of 0.1Hz-24 Hz, to eliminate high-frequency noise from the signal.

After filtering, we detect maximum BR peaks and their corresponding percentage values. Summing these peaks from each video clip reveals the patient's chest movements for breathing, indicating respiratory effort. This analysis across all clips allows comparison of respiratory effort, reflecting anxiety levels.

### Graphical Interface (GUI)

In order to facilitate visualization of anxiety levels for each patient and video clip, we created a graphical user interface (GUI) for each patient. This GUI allows visualization of processed ECG, GSR, and BR plots for each video clip, as well as displaying the average heart rate, average GSR peak values, and maximum BR value.

<img width="1218" alt="GUI" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/083223da-ddd5-48f5-be45-55aaea3b009e">

***Figure 3**- Graphical interface for visualization of biosignals and presentation of extracted values.*

## Results
In addition to the GUI, our analysis was based on a stem plot, where the y-axis represents the values obtained for average heart rate, the mean of GSR peak values, and the maximum BR value, and the x-axis denotes the video clip numbers, with video clip 0 corresponding to the demonstration clip.

<img width="1089" alt="stem1" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/b32489b0-d8fe-4a5b-b359-946b1906158f">

<img width="1061" alt="stem2" src="https://github.com/rubensilvab/Detection-of-Anxiety-Levels-in-Patients-with-Arachnophobia-Through-Biosignals/assets/130314085/811182c0-ba4a-4bc3-a942-7caa388c1b84">

***Figure 4**- Values for BPM, maximum GRS, and maximum BR for Patient 9 and Patient 3.*

Analyzing the GUI and stem plot for patient 3, video clip 5 induced the highest heart rate, HRV, GSR peak, skin conductance level, and BR peak. Thus, it was the most anxiety-inducing. Some other clips also showed increased variables compared to the reference, indicating moderate anxiety levels, like in clip 6. Surprisingly, clip 0 (demonstration) didn't have the lowest values, possibly due to patient nervousness.

Patient 9's results were inconclusive, lacking a clear peak across the calculated values compared to the reference level (assumed near the values of video clip 0, the demonstration). However, video clip 16 appeared to contribute most to patient 9's anxiety, with video clip 5 inducing an intermediate level. Patient 9 exhibited higher anxiety levels than patient 3, with significantly higher BPM and more frequent BR fluctuations.

## Conclusion

In summary, with this work, we were able to study and monitor the psychophysiological response of two patients with arachnophobia throughout an exposure therapy session, through the processing of ECGs, GSRs, and BRs in Matlab. Both patients still exhibit a weak ability to control their anxiety levels when confronted with spiders, indicating the need for further medical assistance and more exposure therapy sessions, or alternative forms of treatment. We also concluded that, for Patient 3, video clip 5 was the most anxiety-inducing, while for Patient 9, video clip 16 was the most anxiety-inducing. Thus, we acknowledge the subjectivity of fear perception among the patients under study and the potential errors in the proposed methodology, which may interfere with the expected outcome of identifying a single, most disturbing video clip.




