int dataRate = 100;
uint32_t loopDuration() { return 1'000'000 / dataRate; }
uint32_t loopTimer;
uint32_t nowTime;
void setup() { loopTimer = micros(); }

void loop() {
    nowTime = micros();
    //
    // loop content here
    //
    uint32_t currentTime = micros();
    uint32_t duration    = loopDuration();
    while (currentTime - looptimer <= duration) {
        currentTime = micros();
    }
    loopTimer = currentTime;
}
