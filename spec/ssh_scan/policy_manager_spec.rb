require 'rspec'
require 'ssh_scan/policy_manager'
require 'ssh_scan/policy'

describe SSHScan::PolicyManager do
	context "when checking out of policy encryption" do
		yaml_string = "---\nname: Mozilla Intermediate\nkex:\n" +
                  "- diffie-hellman-group-exchange-sha256\n" +
                  "encryption:\n- aes256-ctr\n- aes192-ctr\n" +
                  "- aes128-ctr\nmacs:\n- hmac-sha2-512\n" +
                  "- hmac-sha2-256\ncompression:\n- none\n" +
                  "- zlib@openssh.com\n" +
                  "references:\n- https://wiki.mozilla.org/Security/Guidelines/OpenSSH\n"
    result =  {
			:encryption_algorithms_client_to_server => [
		    "chacha20-poly1305@openssh.com",
		    "aes128-ctr",
		    "aes192-ctr",
		    "aes256-ctr",
		    "aes128-gcm@openssh.com",
		    "aes256-gcm@openssh.com"
			],
			:encryption_algorithms_server_to_client => [
		    "chacha20-poly1305@openssh.com",
		    "aes128-ctr",
		    "aes192-ctr",
		    "aes256-ctr",
		    "aes128-gcm@openssh.com",
		    "aes256-gcm@openssh.com"
			  ]
		}

		it "should load all the attributes properly" do
			policy = SSHScan::Policy.from_string(yaml_string)
			policy_obj = SSHScan::PolicyManager.new(result,policy)
			out_of_policy_enc = policy_obj.out_of_policy_encryption()
	    end
	end

	context "when checking the missing policy encryption" do
		yaml_string = "---\nname: Mozilla Intermediate\nkex:\n" +
                  "- diffie-hellman-group-exchange-sha256\n" +
                  "encryption:\n- aes256-ctr\n- aes192-ctr\n" +
                  "- aes128-ctr\nmacs:\n- hmac-sha2-512\n" +
                  "- hmac-sha2-256\ncompression:\n- none\n" +
                  "- zlib@openssh.com\n" +
                  "references:\n- https://wiki.mozilla.org/Security/Guidelines/OpenSSH\n"
    result = {
			:encryption_algorithms_client_to_server => [
		    "chacha20-poly1305@openssh.com",
		    "aes128-ctr",
		    "aes192-ctr",
		    "aes256-ctr",
		    "aes128-gcm@openssh.com",
		    "aes256-gcm@openssh.com"
			],
			:encryption_algorithms_server_to_client => [
		    "chacha20-poly1305@openssh.com",
		    "aes128-ctr",
		    "aes192-ctr",
		    "aes256-ctr",
		    "aes128-gcm@openssh.com",
		    "aes256-gcm@openssh.com"
			]
		}

		it "should load all the attributes properly" do
			policy = SSHScan::Policy.from_string(yaml_string)
			policy_obj = SSHScan::PolicyManager.new(result,policy)
			missing_policy_enc = policy_obj.missing_policy_encryption()
	    end
	end

	context "when checking out of policy macs" do
		yaml_string = "---\nname: Mozilla Intermediate\nkex:\n" +
                  "- diffie-hellman-group-exchange-sha256\n" +
                  "encryption:\n- aes256-ctr\n- aes192-ctr\n" +
                  "- aes128-ctr\nmacs:\n- hmac-sha2-512\n" +
                  "- hmac-sha2-256\ncompression:\n- none\n" +
                  "- zlib@openssh.com\n" +
                  "references:\n- https://wiki.mozilla.org/Security/Guidelines/OpenSSH\n"
    result =  {
			:mac_algorithms_client_to_server => [
		    "umac-64-etm@openssh.com",
		    "umac-128-etm@openssh.com",
		    "hmac-sha2-256-etm@openssh.com",
		    "hmac-sha2-512-etm@openssh.com",
		    "hmac-sha1-etm@openssh.com",
		    "umac-64@openssh.com",
		    "umac-128@openssh.com",
		    "hmac-sha2-256",
		    "hmac-sha2-512",
		    "hmac-sha1"
			],
			:mac_algorithms_server_to_client => [
		    "umac-64-etm@openssh.com",
		    "umac-128-etm@openssh.com",
		    "hmac-sha2-256-etm@openssh.com",
		    "hmac-sha2-512-etm@openssh.com",
		    "hmac-sha1-etm@openssh.com",
		    "umac-64@openssh.com",
		    "umac-128@openssh.com",
		    "hmac-sha2-256",
		    "hmac-sha2-512",
		    "hmac-sha1"
			]
		}

		it "should load all the attributes properly" do
			policy = SSHScan::Policy.from_string(yaml_string)
			policy_obj = SSHScan::PolicyManager.new(result,policy)
			out_of_policy_mac = policy_obj.out_of_policy_macs()
    	end
	end

	context "when checking the missing policy macs" do
		yaml_string = "---\nname: Mozilla Intermediate\nkex:\n" +
                  "- diffie-hellman-group-exchange-sha256\n" +
                  "encryption:\n- aes256-ctr\n- aes192-ctr\n" +
                  "- aes128-ctr\nmacs:\n- hmac-sha2-512\n" +
                  "- hmac-sha2-256\ncompression:\n- none\n" +
                  "- zlib@openssh.com\n" +
                  "references:\n- https://wiki.mozilla.org/Security/Guidelines/OpenSSH\n"
    result = {
			:mac_algorithms_client_to_server => [
		    "umac-64-etm@openssh.com",
		    "umac-128-etm@openssh.com",
		    "hmac-sha2-256-etm@openssh.com",
		    "hmac-sha2-512-etm@openssh.com",
		    "hmac-sha1-etm@openssh.com",
		    "umac-64@openssh.com",
		    "umac-128@openssh.com",
		    "hmac-sha2-256",
		    "hmac-sha2-512",
		    "hmac-sha1"
			],
			:mac_algorithms_server_to_client => [
		    "umac-64-etm@openssh.com",
		    "umac-128-etm@openssh.com",
		    "hmac-sha2-256-etm@openssh.com",
		    "hmac-sha2-512-etm@openssh.com",
		    "hmac-sha1-etm@openssh.com",
		    "umac-64@openssh.com",
		    "umac-128@openssh.com",
		    "hmac-sha2-256",
		    "hmac-sha2-512",
		    "hmac-sha1"
			]
		}

		it "should load all the attributes properly" do
			policy = SSHScan::Policy.from_string(yaml_string)
			policy_obj = SSHScan::PolicyManager.new(result,policy)
			missing_policy_mac = policy_obj.missing_policy_macs()
	    end
	end

end





