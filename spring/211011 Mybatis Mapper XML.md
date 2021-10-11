1. SELECT

```xml
<select id="selectPerson" parameterType="int" resultType="hashmap">
SELECT * FROM PERSON WHERE ID = #{id}
</select>
```

- id 속성: 필수 속성으로 전체 Mapper 파일들 내에서 ㅇ유일한 아이디를 등록한다
- `<mapper namespace="">` 에서 namespace 값이 다르면 같은 id도 다른 id로 인식된다.
- paramaterType 속성: 외부로부터 데이터를 받아올 때 사용하는 속성
- resultType 속성: 주로 select 구문 처리후 DBMS로부터 결과를 받아올 때 사용한다.(select에서 생략불가)

2. INSERT, UPDATE, DELETE

   - INSERT의 selectKey는 기본 키 필드의 자성 생성을 지원한다.
   - `<selectKey>`를 사용하면 생성된 키를 쉽게 가져올 수 있다.

   ```xml
   <insert id="insertAuthor" parameterType="domain.blog.Author">
           <selectKey keyProperty="id" resultType="int" >
                   select board_seq.nextval as id from dual
           </selectKey>
           insert into Author (id,username,password,email,bio)
           values (#{id},#{username},#{password},#{email},#{bio})
   </insert>
   ```

   ```xml
   <update id="updateAuthor" parameterType="domain.blog.Author">
           update Author set
           username = #{username},
           password = #{password},
           email = #{email},
           bio = #{bio}
           where id = #{id}
   </update>
   ```

   ```xml
   <delete id="deleteAuthor" parameterType="int">
           delete from Author where id = #{id}
   </delete>
   ```

   3. resultMap 속성

   - 결과를 Mapping 할 때 하나의 java 객체로 안 되는 경우에 사용한다 (ex: join)
   - 테이블 컬럼명과 Mapping 할 자바 java 객체의 필드명이 다를 때도 사용한다.

   ```xml
   <resultMap id="selectResult" type="board">
        <result property="num" column = 'seq'>
        <result property="title" column = 'subject'>
        <result property="content" column = 'content'>
        <result property="redate" column = 'redate'>
   </resultMap>
   ```

   ```xml
   <select id="selectBoard" parameterType="int" resultMap="selectResult">
       SELECT * FROM board WHERE num = #{num}
   </select>
   ```

   4. CDATA Section 사용

   - SQL 구문에 <, > 사용하면 에러 발생

   ```xml
   <select id="selectBoard" parameterType="int" resultType="board">
       SELECT *
       FROM board
      <![CDATA[
       WHERE num <= #{num}
       ]]>
   </select>
   ```

   5. 동적 SQL

   - if
   - choose, when, otherwise
   - where
   - set
   - foreach

