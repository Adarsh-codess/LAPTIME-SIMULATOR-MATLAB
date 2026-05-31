clc
clear
close all

%% TRACK DATA
lengths = [700 100 300 200 500];      % Sector lengths (m)
speeds  = [180 120 190 80 200];       % Target speeds (km/h)

%% TRACK INFO
cumulativeDist = cumsum(lengths);
trackLength = sum(lengths);

%% SIMULATION GRID
distance = 0:1:trackLength;

%% VEHICLE PARAMETERS
accelGain = 0.05;   % smooth acceleration gain
brakeGain = 0.08;   % smooth braking gain

%% STORAGE
simSpeed = zeros(size(distance));
simState = strings(size(distance));

%% INITIAL CONDITIONS
currentSpeed = 0;
state = "ACCEL";

%% MAIN LOOP
for k = 1:length(distance)

    currentDistance = distance(k);

    %% Find current sector
    segment = find(currentDistance <= cumulativeDist, 1);
    targetSpeed = speeds(segment);

    %% Safe defaults
    nextTarget = targetSpeed;
    brakePoint = inf;

    %% Look-ahead braking logic
    if segment < length(speeds)

        nextTarget = speeds(segment + 1);

        if nextTarget < targetSpeed
            lose_speed = targetSpeed - nextTarget;
            lose_distance = lose_speed / 0.6;  % brakeRate concept preserved
            cornerDistance = cumulativeDist(segment);
            brakePoint = cornerDistance - lose_distance;
        end
    end

    %% STATE MACHINE
    switch state

        case "ACCEL"
            speedError = targetSpeed - currentSpeed;
            currentSpeed = currentSpeed + accelGain * speedError;

            if abs(speedError) < 0.5
                state = "CRUISE";
            end

        case "CRUISE"
            speedError = targetSpeed - currentSpeed;
            currentSpeed = currentSpeed + accelGain * speedError;

            if currentDistance >= brakePoint
                state = "BRAKE";
            end

        case "BRAKE"
            speedError = nextTarget - currentSpeed;
            currentSpeed = currentSpeed + brakeGain * speedError;

            if abs(speedError) < 0.5
                state = "ACCEL";
            end

        case "FINISH"
            currentSpeed = max(0, currentSpeed);

    end

    %% FINISH CONDITION
    if segment == length(speeds) && currentDistance >= trackLength
        state = "FINISH";
    end

    %% STORE
    simSpeed(k) = currentSpeed;
    simState(k) = state;

end

%% PLOT SPEED
figure
plot(distance, simSpeed, 'LineWidth', 2)
grid on
xlabel('Distance (m)')
ylabel('Speed (km/h)')
title('Smooth FSM Lap Simulation (Fixed Physics)')

%% STYLE
set(gcf,'Color','k')
set(gca,'Color','k','XColor','w','YColor','w','GridColor',[0 1 0])