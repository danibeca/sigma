<?php

namespace Sigma\Listeners;

use Sigma\Events\UserRegisterConfirmation;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class Email implements ShouldQueue
{
    use InteractsWithQueue;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  UserRegisterConfirmation  $event
     * @return void
     */
    public function handle(UserRegisterConfirmation $event)
    {
      
        $data = array(                
            'code' => $event->user->activation_code,
        );
        

        \Mail::send('emails.verify',$data, function($message) use ($event) {
            $message->to($event->user->email, $event->user->name)
                ->subject( \Lang::get('auth.verify_subject') );;
        });

    }
}
