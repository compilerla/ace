RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Submission' do
    configure :user do
      pretty_value do
        bindings[:object].user.email
      end
    end

    configure :project_id do
      pretty_value do
        Project.find(bindings[:object].project_id).title
      end
    end

    configure :hours_logs do
      pretty_value do
        submission = bindings[:object]
        view = ActionView::Base.new(ActionController::Base.view_paths, {})
        view.render partial: 'submissions/hours_table', locals: { submission: submission }
      end
    end
  end
end
