package com.hourslot.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NotificationPreference {

    private User user;

    private String channel;

    private String eventType;

    @Builder.Default
    private boolean enabled = true;
}
