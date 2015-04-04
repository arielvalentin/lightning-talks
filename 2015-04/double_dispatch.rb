#Courtesy of http://stackoverflow.com/questions/15845748/attempt-at-understanding-the-double-dispatch-pattern

class Dentist
  def work_on(patient)
    patient.dispatch_work(self)
  end

  def work_on_adult(patient)
    drill_as_hard_as_you_can(patient)
  end

  def work_on_child(patient)
    use_bubble_gum_toothpaste(patient)
    give_toothbrush_to(patient)
  end
end

class Doctor
  def work_on(patient)
    patient.dispatch_work(self)
  end
  def work_on_adult(patient)
    do_checkup(patient)
  end
  def work_on_child(patient)
    assure_presence_of(patient.guardian)
    ask_questions_to(patient.guardian)
    do_checkup(patient)
    give_cheap_toy_to(patient)
  end
end



class Adult
  def dispatch_work(dentist)
    dentist.work_on_adult(self)
  end
end

class Child
  def dispatch_work(dentist)
    dentist.work_on_child(self)
  end
end
