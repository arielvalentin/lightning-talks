def see_the_alergist(family)
  dr_delacruz = Doctor.new
  family.each do |patient|
    dr_delacruz.work_on(patient)
  end
end

def see_the_dentist(family)
  dr_dogan = Dentist.new
  family.each do |patient|
    dr_dogan.work_on(patient)
  end
end
