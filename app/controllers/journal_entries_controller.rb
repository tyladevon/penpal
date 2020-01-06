class JournalEntriesController < ApplicationController
  def create
    new_entry = current_user.journal_entries.new
    new_entry.update(journal_params)
    if new_entry.save
      redirect_to landing_path
    end
    session.delete(:suggestion)
  end

  private

    def journal_params
      params.require(:journal_entry).permit(:entry)
    end
end
