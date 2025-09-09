#ifndef _PORT_METADATA_P4_
#define _PORT_METADATA_P4_



/*
 * User defined metadata type
 */
struct port_metadata_t {
    SubIntId_t portid;
}
#endif	// _PORT_METADATA_P4_

#ifndef _INGRESS_METADATA_P4_
#define _INGRESS_METADATA_P4_
/*
 * User defined metadata type
 */
struct ingress_metadata_t {
    // Metadata fields from Bruno
    bit<32> switch_id;
    bit<32> class_id;
    bit<32> drift;
    bit<32> m_n;
    bit<32> m_sum;
    bit<32> m_p;
    bit<32> z_t;
    bit <16> srcPort;
    bit <16> dstPort;
    bit <8> protocol;
    bit<8> pass_cnt;
    port_metadata_t port_md;
    bit<8> node_id; 
    bit<8> next_node_id;
    bit<1> do_resubmit;
    bit<2> if_pass;
    bit<1> annomaly;
    bit<32> mn;
    bit<32> msum;
    bit<32> mp;
    bit<32> zt;
    bit<5> ewma_counter;
    bool is_mn_le_mp;
    @transient bit<32> sub_result;
    bit<16> prob_p;


    // Add this new field
    @transient bit<32> temp_shifted_mn;
    @transient bit<1>  sign_bit;
    bit<8> ewma_bit_shift;


#ifdef NEED_PKTLEN
    bit<16> pktlen;
#endif
#ifdef NEED_REPLICA
    bit<16> clone_session;
#endif
    NextHopId_t nexthop_id;
    SubIntPad_t _padding1;
    SubIntId_t target_id;
    SubIntPad_t _padding2;
    SubIntId_t source_id;
    SubIntId_t ingress_id;
    SubIntId_t aclport_id;
#ifdef HAVE_BRIDGE
    switch_vrf_t bridge_id;
    SubIntId_t bridge_src;
    SubIntId_t bridge_trg;
#endif
    SubIntId_t output_id;
    ethertype_t ethertype;
    switch_vrf_t vrf;
#ifdef HAVE_POLKA
    bit<16> polka_next;
#endif
#ifdef HAVE_MPLS
    label_t mpls_encap_egress_label;
    label_t mpls_encap_svc_label;
#endif
#ifdef HAVE_SRV6
    ipv6_addr_t srv_target;
#endif
    bit <3> mpls_op_type;
    bit <3> srv_op_type;
    bit <1> srv_remove;
    bit <1> saw_rsvp;
    bit <1> bier_remove;
    bit <1> polka_remove;
    bit <1> nsh_remove;
    bit <1> mpls0_remove;
    bit <1> mpls1_remove;
#ifdef NEED_REPLICA
    SubIntId_t rpf_iface;
#endif
#ifdef HAVE_INQOS
    SubIntId_t inqos_id;
    bit <8> inqos_res;
#endif
#ifdef HAVE_OUTQOS
    SubIntId_t outqos_id;
    bit <8> outqos_res;
#endif
#ifdef HAVE_FLOWSPEC
    SubIntId_t flowspec_id;
    bit <8> flowspec_res;
#endif
#ifdef HAVE_PPPOE
    bit<1>  pppoe_ctrl_valid;
    bit<1>  pppoe_data_valid;
#endif
#ifdef HAVE_MPLS
    bit <1> mpls0_valid;
    bit <1> mpls1_valid;
#endif
#ifdef HAVE_POLKA
    bit <1> polka_valid;
#endif
#ifdef HAVE_NSH
    bit <1> nsh_valid;
#endif
#ifdef HAVE_SGT
    bit <1> sgt_valid;
#endif
#ifdef HAVE_GTP
    bit<3>  gtp_type;
#endif
    bit <1> arp_valid;
    bit <1> ipv4_valid;
    bit <1> ipv6_valid;
#ifdef HAVE_FRAG
    bit <3> layer3_frag;
#endif
    layer4_port_t layer4_srcprt;
    layer4_port_t layer4_dstprt;
#ifdef HAVE_SGT
    sec_grp_t sec_grp_id;
#endif
    bit <1> srv_encap_l3vpn_valid;
    bit <1> mpls_encap_rawip_valid;
    bit <1> mpls_encap_l3vpn_valid;
    bit <1> mpls_encap_l2vpn_valid;
    bit <3> mpls_encap_decap_sap_type; // service access point type
#ifdef HAVE_NAT
    bit<1> natted_ipv4tcp;
    bit<1> natted_ipv4udp;
    bit<1> natted_ipv6tcp;
    bit<1> natted_ipv6udp;
    checksum_t checksum_tcp_tmp;
    checksum_t checksum_udp_tmp;
#endif
    l4_lookup_t   l4_lookup;
    ethertype_t always_zero; // hack
}
#endif	// _INGRESS_METADATA_P4_
#

#ifndef _EGRESS_METADATA_P4_
#define _EGRESS_METADATA_P4_

struct egress_metadata_t {}

struct my_resubmit_t {
    bit<8> pass_cnt;      // carry state to next ingress pass
    bit<16> extra_tag;    // any tag you want
    bit<8> node_id; // node identification in the next tree level 
}

#endif  // _EGRESS_METADATA_P4_
