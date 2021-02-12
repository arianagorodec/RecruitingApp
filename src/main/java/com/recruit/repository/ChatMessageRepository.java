package com.recruit.repository;

import com.recruit.entity.ChatMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage,Long> {
    @Query("select a from ChatMessage a where a.userFrom.id_user = :from")
    List<ChatMessage> getByFrom(@Param("from") long from);
    @Query("select a from ChatMessage a where a.userTo.id_user = :to")
    List<ChatMessage> getByTo(@Param("to") long to);
    @Query("select a from ChatMessage a where a.userTo.id_user = :to and  a.userFrom.id_user = :from")
    List<ChatMessage> getByToAndFrom(long to, long from);
    @Query("select a from ChatMessage a where a.userTo.id_user = :to and a.userFrom.id_user =:from or  " +
            "a.userTo.id_user = :from and a.userFrom.id_user = :to")
    List<ChatMessage> getByToTwice(long to, long from);
}
