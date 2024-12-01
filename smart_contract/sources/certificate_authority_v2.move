
module certificate_authority::Cert {
    use sui::tx_context::{Self, TxContext};
    use sui::table::{Self, Table};
    use sui::transfer;
    // use sui::tx_context::{Self, TxContext};


    // === Structs ===
    /// Certificate Authority structure
    public struct CertificateAuthority has key, store {
        id: UID,
        address: address,
    }

    /// Certificate structure
    public struct Certificate has key, store {
        id: UID,
        issuer: address,
        recipient: address,
        ipfs_link: vector<u8>,
    }

    // Mapping from authority address to a vector of certificate IDs
    // struct AuthorityCertificates has store {
    //     table: Table<address, vector<UID>>,
    // }

    // // Global storage for certificates
    // struct CertificateStorage has store {
    //     table: Table<UID, Certificate>,
    // }


    public struct AuthorityCertificates has key, store {
        id: UID,
        table: Table<address, vector<UID>>,
    }

    public struct CertificateStorage has key, store {
        id: UID,
        table: Table<address, Certificate>,
    }


    public fun init_authorities(ctx: &mut TxContext): AuthorityCertificates {
        AuthorityCertificates { id: object::new(ctx), table: table::new<address, vector<UID>>(ctx) }
    }

    public fun init_certificates(ctx: &mut TxContext): CertificateStorage {
        CertificateStorage { id: object::new(ctx), table: table::new<address, Certificate>(ctx) }
    }

    // === Functions ===

    /// Register a Certificate Authority
    public fun register_authority(storage: &mut AuthorityCertificates, ctx: &mut TxContext) {
        // let authority = CertificateAuthority {
        //     id: object::new(ctx),
        //     address: ctx.sender(),
        // };

        // Add the authority to the global AUTHORITIES table

        // table::add(&mut storage.table, ctx.sender(), vector::empty<UID>());
        
        if (!table::contains(&storage.table, ctx.sender())) {
            table::add(&mut storage.table, ctx.sender(), vector::empty<UID>());
        }
        // transfer::share_object(authority);

        // authority;
    }

    /// Issue a certificate
    public fun issue_certificate(
        storage: &mut CertificateStorage,
        authority: &CertificateAuthority, // must be can derive from ctx.sender()
        recipient: address,
        ipfs_link: vector<u8>,
        ctx: &mut TxContext,
    )  {
        // Ensure the authority issuing the certificate is the same as the current sender
        assert!(authority.address == ctx.sender(), 0);

        // Create a new certificate
        let certificate = Certificate {
            id: object::new(ctx),
            issuer: ctx.sender(),
            recipient,
            ipfs_link,
        };
        // storage.table.add(recipient, certificate);

        // Add the certificate ID to the authority's list in AUTHORITIES
        // let cert_id = object::id(&certificate);
        // let mut cert_list = table::borrow_mut(&mut storage.table, ctx.sender());
        // let mut updated_list = *cert_list;
        // vector::push_back(&mut updated_list, cert_id);
        // table::add(&mut storage.table, ctx.sender(), updated_list);
        table::add(&mut storage.table, ctx.sender(), certificate);

        // Store the certificate in the global CERTIFICATES table
        // table::add(&mut storage.table, cert_id, certificate);

        // certificate
    }

    // Get all certificates issued by a specific authority
    // public fun get_certificates_by_authority(authority_address: address): vector<UID> acquires AuthorityCertificates {
    //     if (Table::contains_key(&AUTHORITIES.table, authority_address)) {
    //         Table::borrow(&AUTHORITIES.table, authority_address)
    //     } else {
    //         vector::empty<UID>()
    //     }
    // }

    // Get certificate details by certificate ID
    // public fun get_certificate_by_id(cert_id: UID): Certificate acquires CertificateStorage {
    //     Table::borrow(&CERTIFICATES.table, cert_id)
    // }
}
