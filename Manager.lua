-- // Dependencies
local SignalBuilder = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Signal/main/Module.lua"))()

-- // Manager Class
local Manager = {}
Manager.__index = Manager
do
    -- // Constructor
    function Manager.new()
        -- // Initialise class
        local self = setmetatable({}, Manager)

        -- // Initialise vars
        local Signals = {}

        -- // Return class
        return self
    end

    -- // Find a signal
    function Manager.Get(self, SignalName)
        return self.Signals[SignalName]
    end

    -- // Add a signal
    function Manager.Add(self, Signal)
        -- // Add
        self.Signals[Signal.Name] = Signal
    end

    -- // Remove a signal
    function Manager.Remove(self, SignalName)
        -- // Remove
        self.Signals[SignalName] = nil
    end

    -- // Create a signal
    function Manager.Create(self, SignalName)
        -- // Create the signal
        local Signal = SignalBuilder.new(SignalName)

        -- // Add it
        self:Add(Signal)

        -- // Return the signal
        return Signal
    end

    -- // Fire a signal
    function Manager.Fire(self, SignalName, ...)
        -- // Get the signal
        local Signal = self:Get(SignalName)

        -- // Make sure signal exists
        assert(Signal, "signal does not exist")

        -- // Fire
        return Signal:Fire(...)
    end

    -- // Connect to a signal
    function Manager.Connect(self, SignalName, ...)
        -- // Get the signal
        local Signal = self:Get(SignalName)

        -- // Make sure signal exists
        assert(Signal, "signal does not exist")

        -- // Connect
        return Signal:Connect(...)
    end
end

-- // Return
return Manager