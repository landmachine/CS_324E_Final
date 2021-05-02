class Timer {
  int displayTime;  // Ideal display time for each frame
  int milliStart;   // Start time, corrected for pausing
  int pausedTime;   // Time at which timer is paused
  boolean paused;   // Is the timer paused?

  Timer(int dt) {
    displayTime = dt;
    milliStart = millis();
    paused = false;
    pausedTime = 0;
  }

  boolean isTime() {  
    if (!this.paused && millis() - this.milliStart >= this.displayTime) {
      this.milliStart = millis();
      return true;
    }
    return false;
  }

  boolean pause() {
    if (!this.paused) {
      this.paused = true;
      this.pausedTime = millis();
      return true;
    }
    return false;
  }

  boolean unpause() {
    if (this.paused) {
      this.paused = false;
      this.milliStart = millis() - (this.pausedTime - this.milliStart);
      return true;
    }
    return false;
  }
}
