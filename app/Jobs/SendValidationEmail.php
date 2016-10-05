<?php

namespace Sigma\Jobs;

use Sigma\Jobs\Job;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Bus\SelfHandling;
use Illuminate\Contracts\Queue\ShouldQueue;
use Sigma\Models\Security\User;


class SendValidationEmail extends Job implements SelfHandling, ShouldQueue
{
    use InteractsWithQueue, SerializesModels;

    protected $user;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
         $data = array(                
            'code' => $this->user->activation_code,
        );
        

        \Mail::send('emails.verify',$data, function($message) {
            $message->to($this->user->email, $this->user->name)
                ->subject( \Lang::get('auth.verify_subject') );;
        });
    }
}
