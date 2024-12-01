/*
module certificate_authority::Test {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::TxContext;
    use sui::test_scenario;
    // use sui::signer::{self, Signer};
    // use sui::vector;
    use certificate_authority::CertificateAuthority::CertificateAuthority;
    use certificate_authority::CertificateAuthority::Certificate;

    #[test]
    public fun test_register_authority(ctx: &mut TxContext) {
        let sender = &ctx.sender();

        // Register a new Certificate Authority
        certificate_authority::CertificateAuthority::register_authority(ctx);

        // Verify that the Certificate Authority was created
        // let authority_id = object::address_to_object_id(sender);
        let authority_id = *sender;
        // let authority = transfer::borrow_object<CertificateAuthority>(authority_id, ctx);
        let authority = transfer::borrow_object<CertificateAuthority>(authority_id, ctx);
        assert!(authority.address == sender, 0);
    }

    #[test]
    public fun test_issue_certificate(ctx: &mut TxContext) {
        let sender = signer::address_of(&ctx.sender());
        let recipient = signer::address_of(&ctx.sender()); // For simplicity, using the same address

        // Register a new Certificate Authority
        certificate_authority::CertificateAuthority::register_authority(ctx);

        // Get the Certificate Authority object
        let authority_id = object::address_to_object_id(sender);
        let authority = transfer::borrow_object<CertificateAuthority>(authority_id, ctx);

        // Issue a certificate
        let ipfs_link = vector::empty<u8>();
        vector::push_back(&mut ipfs_link, 1); // Example IPFS link
        MyModule::issue_certificate(&authority, recipient, ipfs_link, ctx);

        // Verify that the Certificate was created
        let certificate_id = object::address_to_object_id(recipient);
        let certificate = transfer::borrow_object<Certificate>(certificate_id, ctx);
        assert!(certificate.issuer == sender, 0);
        assert!(certificate.recipient == recipient, 0);
        assert!(vector::length(&certificate.ipfs_link) == 1, 0);
    }
}
*/


/*
#[test_only]
module certificate_authority::certificate_authority_tests;
// uncomment this line to import the module
// use certificate_authority::certificate_authority;

const ENotImplemented: u64 = 0;

#[test]
fun test_certificate_authority() {
    // pass
}

#[test, expected_failure(abort_code = ::certificate_authority::certificate_authority_tests::ENotImplemented)]
fun test_certificate_authority_fail() {
    abort ENotImplemented
}
*/

/*
script {
    // use certificate_authority::CertificateAuthority;
    // use sui::transfer;
    // use sui::tx_context::{self, TxContext};
    // use std::assert;

    fun main() {
        let mut ctx = tx_context::new_for_testing();
        let authority_address = ctx.sender();

        // Register a Certificate Authority
        CertificateAuthority::register_authority(&mut ctx);
        let authority = transfer::take_object<CertificateAuthority::CertificateAuthority>(authority_address);

        // Issue a certificate
        let recipient_address = @0x2;
        let ipfs_link = b"QmExampleHash".to_vec();
        CertificateAuthority::issue_certificate(&authority, recipient_address, ipfs_link, &mut ctx);

        // Verify the certificate was issued
        let certificate = transfer::take_object<CertificateAuthority::Certificate>(recipient_address);
        assert!(certificate.issuer == authority_address, 0);
        assert!(certificate.recipient == recipient_address, 0);
        assert!(certificate.ipfs_link == ipfs_link, 0);
    }
}
*/

module certificate_authority::certificate_test {
    // use certificate_authority::CertificateAuthority;
    // #[test_only] use sui::tx_context::{Self, TxContext};
    // use std::assert;

    // #[test]
    // public fun test_register_authority_and_issue_certificate() {
        // let mut ctx = tx_context::dummy();
        // let authority_address = ctx.sender();

        // // Test: Register a Certificate Authority
        // CertificateAuthority::register_authority(&mut ctx);
        // let authority = CertificateAuthority::CertificateAuthority{
        //     id: object::new(&mut ctx),
        //     address: authority_address
        // };
        // let foo = certificate_authority::CertificateAuthority::register_authority();
        // assert!(authority.address == authority_address, 0);

        // // Test: Issue a certificate
        // let recipient_address = @0x2;
        // let ipfs_link = b"QmExampleHash".to_vec();
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
    // }
}


/*
module certificate_authority::Test {
    use std::signer;
    use std::vector;
    use sui::object;
    use sui::transfer;
    use sui::tx_context::TxContext;
    use certificate_authority::CertificateAuthority::CertificateAuthority;
    use certificate_authority::CertificateAuthority::Certificate;

    #[test]
    public fun test_register_authority(ctx: &mut TxContext) {
        let sender = signer::address_of(&ctx.sender());

        // Register a new Certificate Authority
        MyModule::register_authority(ctx);

        // Verify that the Certificate Authority was created
        let authority = transfer::borrow_object<CertificateAuthority>(object::address_to_object_id(sender), ctx);
        assert!(authority.address == sender, 0);
    }

    #[test]
    public fun test_issue_certificate(ctx: &mut TxContext) {
        let sender = signer::address_of(&ctx.sender());
        let recipient = signer::address_of(&ctx.sender()); // For simplicity, using the same address

        // Register a new Certificate Authority
        MyModule::register_authority(ctx);

        // Get the Certificate Authority object
        let authority = transfer::borrow_object<CertificateAuthority>(object::address_to_object_id(sender), ctx);

        // Issue a certificate
        let ipfs_link = vector::empty<u8>();
        vector::push_back(&mut ipfs_link, 1); // Example IPFS link
        MyModule::issue_certificate(&authority, recipient, ipfs_link, ctx);

        // Verify that the Certificate was created
        let certificate = transfer::borrow_object<Certificate>(object::address_to_object_id(recipient), ctx);
        assert!(certificate.issuer == sender, 0);
        assert!(certificate.recipient == recipient, 0);
        assert!(vector::length(&certificate.ipfs_link) == 1, 0);
    }
}
*/