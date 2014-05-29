module ResqueWeb
  module WorkingHelper
    def workers
      @workers ||= Resque::WorkerRegistry.all
    end

    def jobs
      @jobs ||= begin
                  workers.map do |worker|
                    Resque::WorkerRegistry.new(worker).job
                  end
                end
    end

    def worker_jobs
      @worker_jobs ||= workers.zip(jobs).reject { |w, j| w.idle? || j['queue'].nil? }
    end

    def sorted_worker_jobs
      @sorted_worker_jobs ||= worker_jobs.sort_by { |w, j| j['run_at'] || '' }
    end
  end
end
