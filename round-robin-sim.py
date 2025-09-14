class Process:
    def __init__(self, name, total_steps):
        self.name = name
        self.total_steps = total_steps
        self.progress = 0

    def is_finished(self):
        return self.progress >= self.total_steps

    def run(self, time_slice):
        steps = min(time_slice, self.total_steps - self.progress)
        self.progress += steps
        return steps


def scheduler(scheduler_list, time_slice):

    while scheduler_list:
        for prcs in scheduler_list[:]:
            if not prcs.is_finished():
                steps_run = prcs.run(time_slice)
                print(
                    f"--> {prcs.name}: ran {steps_run} steps ({prcs.progress}/{prcs.total_steps})")
            else:
                print(f"{prcs.name} is finished.")
                scheduler_list.remove(prcs)

    print("All tasks finished!")


while True:
    userinput = input(
        "Please enter the process names (separated by whitespace):\n").split()
    steps_number = input(
        "Now enter the number of steps in the same order of your processes (separated by whitespace):\n").split()
    try:
        steps_number_int = list(map(int, steps_number))
        if len(userinput) != len(steps_number_int):
            print("Every process needs a number of steps!")
            continue
        all_processes = []

        for pname, steps_num in zip(userinput, steps_number_int):
            process = Process(pname, steps_num)
            all_processes.append(process)

    except ValueError:
        print("Please enter only Integers!")

    try:
        time_slices = int(input("Please enter number of time slices:\n"))

    except ValueError:
        print("Time slices can only be integers!")
        continue

    scheduler(all_processes, time_slices)
    break
