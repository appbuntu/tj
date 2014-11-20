module ThemeJuice
    module Plugins
        class Vagrant < ::Thor
            namespace :vm

            include ::Thor::Actions

            def self.banner(task, namespace = true, subcommand = false)
                "#{basename} #{task.formatted_usage(self, true, subcommand)}"
            end

            ###
            # Start VM
            #
            # @return {Void}
            ###
            desc "start", "Start Vagrant"
            def start
                ::ThemeJuice::warning "Starting Vagrant..."
                run [
                    "cd ~/vagrant",
                    "vagrant up"
                ].join " && "
            end

            ###
            # Stop VM
            #
            # @return {Void}
            ###
            desc "stop", "Stop Vagrant"
            def stop
                ::ThemeJuice::warning "Stopping Vagrant..."
                run [
                    "cd ~/vagrant",
                    "vagrant halt"
                ].join " && "
            end

            ###
            # Suspend VM
            #
            # @return {Void}
            ###
            desc "suspend", "Suspend Vagrant"
            def suspend
                ::ThemeJuice::warning "Suspending Vagrant..."
                run [
                    "cd ~/vagrant",
                    "vagrant suspend"
                ].join " && "
            end

            ###
            # Restart VM
            #
            # @return {Void}
            ###
            desc "restart", "Restart Vagrant"
            def restart
                ::ThemeJuice::warning "Restarting Vagrant..."
                run [
                    "cd ~/vagrant",
                    "vagrant reload"
                ].join " && "
            end

            ###
            # Provision VM
            #
            # @return {Void}
            ###
            desc "provision", "Provision Vagrant"
            def provision
                ::ThemeJuice::warning "Provisioning Vagrant..."
                run [
                    "cd ~/vagrant",
                    "vagrant provision"
                ].join " && "
            end

            ###
            # Completely destroy VM
            #
            # @return {Void}
            ###
            desc "destroy!", "Destroy Vagrant"
            def destroy!
                # Are you really, really sure?
                answer = ask "Are you sure you want to destroy the VM?",
                    :limited_to => ["y", "n"]

                if answer == "y"
                    ::ThemeJuice::error "Destroying Vagrant..."
                    run [
                        "cd ~/vagrant",
                        "vagrant destroy"
                    ].join " && "
                end
            end

            ###
            # SSH into VM
            #
            # @return {Void}
            ###
            desc "ssh", "SSH into Vagrant"
            def ssh
                run [
                    "cd ~/vagrant",
                    "vagrant ssh"
                ].join " && "
            end
        end
    end
end
