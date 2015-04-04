def see_the_alergist(family)
  dr_delacruz = Doctor.new
  family.each do |member|
    dr_delacruz.send("work_on_%s" % [member.class.downcase])
  end
end


def see_the_dentist(family)
  dr_dogan = Dentist.new
  family.each do |member|
    dr_dogan.send("work_on_%s" % [member.class.downcase])
  end
end
