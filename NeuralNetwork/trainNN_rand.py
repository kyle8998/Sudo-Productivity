from numpy import exp, array, random, dot

class NeuronLayer():
    def __init__(self, number_of_neurons, number_of_inputs_per_neuron):
        self.synaptic_weights = 2 * random.random((number_of_inputs_per_neuron, number_of_neurons)) - 1

class NeuralNetwork():
    def __init__(self, layer1, layer2):
        self.layer1 = layer1
        self.layer2 = layer2

    # Sigmoid to normalize between 0 and 1
    def __sigmoid(self, x):
        return 1 / (1 + exp(-x))
    # Sigmoid derivative
    def __sigmoid_derivative(self, x):
        return x * (1 - x)

    # Training
    def train(self, training_set_inputs, training_set_outputs, number_of_training_iterations):
        for i in range(number_of_training_iterations):
            # Pass training set
            output_from_layer_1, output_from_layer_2 = self.think(training_set_inputs)
            # Calculate error
            layer2_error = training_set_outputs - output_from_layer_2
            layer2_delta = layer2_error * self.__sigmoid_derivative(output_from_layer_2)
            # Calculate error
            print layer2_error
            print layer2_delta
            layer1_error = layer2_delta.dot(self.layer2.synaptic_weights.T)
            layer1_delta = layer1_error * self.__sigmoid_derivative(output_from_layer_1)
            print layer1_error
            print layer1_delta
            # Calculate adjustment
            layer1_adjustment = training_set_inputs.T.dot(layer1_delta)
            layer2_adjustment = output_from_layer_1.T.dot(layer2_delta)
            # Adjust the weights.
            self.layer1.synaptic_weights += layer1_adjustment
            self.layer2.synaptic_weights += layer2_adjustment
            random.seed(random.randint(0, 1000000))
            #print random.randint(0, 1000000)
            training_set_inputs = array(
                [[random.randint(0, 1000000), random.randint(0, 1000000), random.randint(0, 1000000)],
                [random.randint(0, 1000000), random.randint(0, 1000000), random.randint(0, 1000000)],
                [random.randint(0, 1000000), random.randint(0, 1000000), random.randint(0, 1000000)]])


    def think(self, inputs):
        output_from_layer1 = self.__sigmoid(dot(inputs, self.layer1.synaptic_weights))
        output_from_layer2 = self.__sigmoid(dot(output_from_layer1, self.layer2.synaptic_weights))
        # Useless output to print
        print (output_from_layer1)
        return output_from_layer1, output_from_layer2

if __name__ == "__main__":

    #Seed the random number generator
    random.seed(random.randint(1,1000000))
    # Create layer 1 (4 neurons, each with 3 inputs)
    layer1 = NeuronLayer(4, 3)

    # Create layer 2 (a single neuron with 4 inputs)
    layer2 = NeuronLayer(1, 4)

    # Combine the layers to create a neural network
    neural_network = NeuralNetwork(layer1, layer2)

    # XOR Training set
    training_set_inputs = array([[0, 0, 1], [0, 1, 1], [1, 0, 1]])
    training_set_outputs = array([[0, 1, 1]]).T
    # Train
    print ("Training Neural Network")
    neural_network.train(training_set_inputs, training_set_outputs, 100000)

    # Test the neural network with a new situation.
    print ("Considering a new situation [1, 1, 0] -> ?: ")
    hidden_state, output = neural_network.think(array([1, 1, 0]))
    print (output)
