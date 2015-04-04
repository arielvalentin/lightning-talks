def see_the_alergist(family)
  dr_delacruz = Doctor.new
  family.each do |member|
    case member
    when Adult
      dr_delacruz.work_on_adult(member)
    when Child
      dr_delacruz.work_on_child(member)
    end
  end
end


def see_the_dentist(family)
  dr_dogan = Dentist.new
  family.each do |member|
    case member
    when Adult
      dr_dogan.work_on_adult(member)
    when Child
      dr_dogan.work_on_child(member)
    end
  end
end
