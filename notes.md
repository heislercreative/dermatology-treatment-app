# Dermatology Treatment App
- Tracks providers' patients, patients' conditions, and whether or not the conditions have been treated.

[] Providers
    - user accounts that are created by signing up, must log in
    - name, username, password
    * have many patients
[] Patients
    - can be added, edited, or deleted by providers
    - name, date of birth, phone number
    * belong to providers
    * have many conditions
[] Conditions
    - can be added, edited, or deleted by providers
    - name, date diagnosed, treated (yes or no), treatment, date treated
    * belong to patients
