%Gaussian mutation
function mutated_individual = gaussian_mutation(individual, mutation_rate, mutation_scale)
  mutated_individual = individual;
  for i = 1:length(individual)
    if rand() < mutation_rate % apply mutation with a probability of mutation_rate
      mutated_individual(i) = mutated_individual(i) + mutation_scale * randn(); % add random noise to the position value
    end
  end
end