
module certificate_authority::CertificateAuthority {

    // Struct to represent a Certificate Authority
    public struct CertificateAuthority has key, store {
        id: UID,
        address: address,
    }


    // Struct to represent a Certificate
    public struct Certificate has key, store {
        id: UID,
        issuer: address,
        recipient: address,
        ipfs_link: vector<u8>,
    }

    // Register a Certificate Authority
    public fun register_authority(ctx: &mut TxContext) {
        transfer::share_object(CertificateAuthority {
            id: object::new(ctx),
            address: ctx.sender(),
        })
    }
    public fun current_authority(self: &CertificateAuthority) : address {
        self.address
    }

    // Issue a certificate
    public fun issue_certificate(
        authority: &CertificateAuthority,
        recipient: address,
        ipfs_link: vector<u8>,
        ctx: &mut TxContext
    ) {
        assert!(authority.address == ctx.sender(), 0); // Only the authority can issue
        transfer::share_object(Certificate {
            id: object::new(ctx),
            issuer: ctx.sender(),
            recipient,
            ipfs_link,
        })
    }
}

    // #[test]
    // public fun test_register_authority_and_issue_certificate() {
    /*
    public fun test_register_authority() {

        let mut ctx = tx_context::dummy();
        let authority_address = ctx.sender();

        // // Test: Register a Certificate Authority
        // CertificateAuthority::register_authority(&mut ctx);
        let authority = CertificateAuthority{
            id: object::new(&mut ctx),
            address: authority_address
        };

        // certificate_authority::CertificateAuthority::register_authority(&mut ctx);
        assert!(authority.address == authority_address);

        // // Test: Issue a certificate
        // let recipient_address = @0x2;
        // let ipfs_link = b"QmExam=pleHash".to_vec();
        // let certificate = CertificateAuthority::issue_certificate_for_testing(
        //     &authority,
        //     recipient_address,
        //     ipfs_link,
        //     &mut ctx,
        // );

        // // Verify the certificate fields
        // assert!(certificate.issuer == authority_address, 0);
        // assert!(certificate.recipient == recipient_address, 0);
        // assert!(certificate.ipfs_link == ipfs_link, 0);
        transfer::public_transfer(authority, @0x0);

    }
    */
