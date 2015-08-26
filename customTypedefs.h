#ifndef CUSTOM_FUNCTION_POINTER_TYPEDEFS
#define CUSTOM_FUNCTION_POINTER_TYPEDEFS

#include <tox/tox.h>

// clang-format off

typedef void (*cb_self_connection_status)(Tox *, TOX_CONNECTION, void *);
typedef void (*cb_tox_friend_name)(Tox *, uint32_t, const uint8_t *, size_t, void *);
typedef void (*cb_tox_friend_status_message)(Tox *, uint32_t, const uint8_t *, size_t, void *);
typedef void (*cb_tox_friend_status)(Tox *tox, uint32_t friend_number, TOX_USER_STATUS status, void *user_data);
typedef void (*cb_tox_friend_connection_status)(Tox *, uint32_t, TOX_CONNECTION, void *);
typedef void (*cb_tox_friend_typing)(Tox *, uint32_t, bool, void *);
typedef void (*cb_tox_friend_read_receipt)(Tox *, uint32_t, uint32_t, void *);
typedef void (*cb_tox_friend_request)(Tox *, const uint8_t *, const uint8_t *, size_t, void *);
typedef void (*cb_tox_friend_message)(Tox *, uint32_t, TOX_MESSAGE_TYPE, const uint8_t *, size_t, void *);
typedef void (*cb_tox_file_recv_control)(Tox *, uint32_t, uint32_t, TOX_FILE_CONTROL, void *);
typedef void (*cb_tox_file_chunk_request)(Tox *, uint32_t, uint32_t, uint64_t, size_t, void *);
typedef void (*cb_tox_file_recv)(Tox *, uint32_t, uint32_t, uint32_t, uint64_t, const uint8_t *, size_t, void *);
typedef void (*cb_tox_file_recv_chunk)(Tox *, uint32_t, uint32_t, uint64_t, const uint8_t *, size_t, void *);
typedef void (*cb_tox_friend_lossy_packet)(Tox *, uint32_t, const uint8_t *, size_t, void *);
typedef void (*cb_tox_friend_lossless_packet)(Tox *, uint32_t, const uint8_t *, size_t, void *);

#endif /* end of include guard: CUSTOM_FUNCTION_POINTER_TYPEDEFS */
