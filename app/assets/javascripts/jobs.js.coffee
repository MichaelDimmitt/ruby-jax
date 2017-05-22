$ ->
  $jobsList = $('#jobsList')

  console.debug("HELLO")

  if $jobsList.length > 0
    $.get 'https://jobs.rubyjax.herokuapp.com/en/job_offers.json', (jobs) ->
      job_links = $.map jobs, (job) ->
        """
          <div class="job col-sm-3">
            <a class="job-link" href="https://jobs.rubyjax.herokuapp.com/en/job_offers/#{job.slug}">
              <strong>#{job.title}</strong><br/>
              Employeur : #{job.company_name}
            </a>
          </div>
        """
      $jobsList.append(job_links.join(''))
