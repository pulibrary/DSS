class MergeCountries < Dry::Operation
  def call(params)
    step(validate_params(params))
      .then { step fetch(it) }
      .then { step merge(it) }
  end

  private

  def validate_params(params)
    if params[:old_id] == params[:new_id]
      Failure("You can't merge a country with itself")
    else
      Success(params)
    end
  end

  def fetch(params)
    # we don't fetch any sensitive data (just Countries), so it is not an IDOR risk
    # nosemgrep: ruby.rails.security.brakeman.check-unscoped-find.check-unscoped-find
    old_country = Country.find(params[:old_id])
    # nosemgrep: ruby.rails.security.brakeman.check-unscoped-find.check-unscoped-find
    new_country = Country.find(params[:new_id])

    if old_country && new_country
      Success({ old: old_country, new: new_country })
    else
      Failure('Incorrect countries submitted for merge, please try again')
    end
  end

  def merge(countries)
    if Country.merge_countries(**countries)
      Success()
    else
      Failure('Could not merge countries, please try again')
    end
  end
end
