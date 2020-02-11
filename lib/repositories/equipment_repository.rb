# frozen_string_literal: true

module Repositories
  class EquipmentRepository < BaseRepository
    self.model     = Models::Equipment
    self.directory = :equipment

    include Features::All
    include Features::Find
    include Features::Save
    include Features::Delete
  end
end
