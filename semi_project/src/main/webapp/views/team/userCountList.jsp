<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팀 관리</title>
</head>
<body>
    <table>
        <tr>
            <th>팀 이름</th>
            <th>현재 팀원 수</th>
            <th>수락하기</th>
        </tr>
        <tr>
            <td>팀 A</td>
            <td id="teamACount">3</td>
            <td><button onclick="acceptUser('teamA')">수락</button></td>
        </tr>
    </table>

    <script>
        const teams = {
            teamA: { name: "팀 A", count: 3 }
        };

        function acceptUser(teamKey) {
            teams[teamKey].count += 1; �
            document.getElementById(`${teamKey}Count`).innerText = teams[teamKey].count; 
        }
    </script>
</body>
</html>