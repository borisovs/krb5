cmake_minimum_required(VERSION 3.20)
project (krb5 LANGUAGES C)

set(TARGET_NAME krb5)
set(TARGET_INCLUDES)
set(TARGET_LIBRARIES)
set(TARGET_COMPILER_OPTIONS)
set(TARGET_COMPILER_DEFS)

file(GLOB_RECURSE HEADERS "*.h")
set(SOURCES krb/addr_comp.c
            krb/addr_order.c
            krb/addr_srch.c
            krb/appdefault.c
            krb/auth_con.c
            krb/cammac_util.c
            krb/ai_authdata.c
            krb/authdata.c
            krb/authdata_exp.c
            krb/authdata_enc.c
            krb/authdata_dec.c
            krb/bld_pr_ext.c
            krb/bld_princ.c
            krb/brand.c
            krb/chk_trans.c
            krb/chpw.c
            krb/conv_creds.c
            krb/conv_princ.c
            krb/copy_addrs.c
            krb/copy_auth.c
            krb/copy_athctr.c
            krb/copy_cksum.c
            krb/copy_creds.c
            krb/copy_data.c
            krb/copy_key.c
            krb/copy_princ.c
            krb/copy_tick.c
            krb/cp_key_cnt.c
            krb/decode_kdc.c
            krb/decrypt_tk.c
            krb/deltat.c
            krb/enc_helper.c
            krb/enc_keyhelper.c
            krb/encode_kdc.c
            krb/encrypt_tk.c
            krb/etype_list.c
            krb/fast.c
            krb/fwd_tgt.c
            krb/gc_via_tkt.c
            krb/gen_seqnum.c
            krb/gen_subkey.c
            krb/gen_save_subkey.c
            krb/get_creds.c
            krb/get_etype_info.c
            krb/get_in_tkt.c
            krb/gic_keytab.c
            krb/gic_opt.c
            krb/gic_pwd.c
            krb/in_tkt_sky.c
            krb/init_ctx.c
            krb/copy_ctx.c
            krb/init_keyblock.c
            krb/kdc_rep_dc.c
            krb/kerrs.c
            krb/kfree.c
            krb/libdef_parse.c
            krb/mk_cred.c
            krb/mk_error.c
            krb/mk_priv.c
            krb/mk_rep.c
            krb/mk_req.c
            krb/mk_req_ext.c
            krb/mk_safe.c
            krb/pac.c
            krb/pac_sign.c
            krb/padata.c
            krb/parse.c
            krb/parse_host_string.c
            krb/plugin.c
            krb/pr_to_salt.c
            krb/preauth2.c
            krb/preauth_ec.c
            krb/preauth_encts.c
            krb/preauth_otp.c
            krb/preauth_pkinit.c
            krb/preauth_sam2.c
            krb/princ_comp.c
            krb/privsafe.c
            krb/random_str.c
            krb/rd_cred.c
            krb/rd_error.c
            krb/rd_priv.c
            krb/rd_rep.c
            krb/rd_req.c
            krb/rd_req_dec.c
            krb/rd_safe.c
            krb/recvauth.c
            krb/response_items.c
            krb/s4u_creds.c
            krb/sendauth.c
            krb/send_tgs.c
            krb/ser_actx.c
            krb/ser_adata.c
            krb/ser_addr.c
            krb/ser_auth.c
            krb/ser_cksum.c
            krb/ser_ctx.c
            krb/ser_key.c
            krb/ser_princ.c
            krb/serialize.c
            krb/set_realm.c
            krb/sname_match.c
            krb/srv_dec_tkt.c
            krb/srv_rcache.c
            krb/str_conv.c
            krb/t_ad_fx_armor.c
            krb/tgtname.c
            krb/unparse.c
            krb/val_renew.c
            krb/valid_times.c
            krb/vfy_increds.c
            krb/vic_opt.c
            krb/walk_rtree.c
            krb/t_walk_rtree.c
            krb/t_kerb.c
            krb/t_ser.c
            krb/t_deltat.c
            krb/t_expand.c
            krb/t_get_etype_info.c
            krb/t_pac.c
            krb/t_parse_host_string.c
            krb/t_princ.c
            krb/t_etypes.c
            krb/t_expire_warn.c
            krb/t_authdata.c
            krb/t_cc_config.c
            krb/t_copy_context.c
            krb/t_in_ccache.c
            krb/t_response_items.c
            krb/t_sname_match.c
            krb/t_valid_times.c
            krb/t_vfy_increds.c
)

list(APPEND TARGET_INCLUDES "${ROOT_INCLUDE_DIR}")
list(APPEND TARGET_INCLUDES "${UTIL_DIR}/et")
list(APPEND TARGET_INCLUDES "${UTIL_DIR}/profile")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/asn.1")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/ccache")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/error_tables")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/keytab")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/krb")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/os")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/rcache")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/unicode")
list(APPEND TARGET_INCLUDES "${ROOT_DIR}/lib/krb5/rpc")

# list(APPEND TARGET_LIBRARIES "win")
# list(APPEND TARGET_LIBRARIES "krb5sprt")

# avoid ntsecapi.h:698:151: note: expected 'void **' but argument is of type 'struct _KERB_RETRIEVE_TKT_RESPONSE **'
list(APPEND TARGET_COMPILE_OPTIONS "-Wno-incompatible-pointer-types")
list(APPEND TARGET_COMPILER_DEFS LIBDIR="${ROOT_DIR}/")

add_library(${TARGET_NAME} SHARED ${HEADERS} ${SOURCES})

set_target_properties(${TARGET_NAME}${BITS} PROPERTIES
                      C_STANDARD 17
                      C_STANDARD_REQUIRED ON
)

target_compile_definitions(${TARGET_NAME} PRIVATE ${TARGET_COMPILER_DEFS})
target_compile_options(${TARGET_NAME} PRIVATE ${TARGET_COMPILER_OPTIONS})
target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDES})
target_link_libraries (${TARGET_NAME} PRIVATE ${TARGET_LIBRARIES})
