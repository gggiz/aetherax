# Aetherax, the Void-Born Cataclysm / 艾瑟拉克斯·虚空灾变

史诗级 Minecraft Boss 战数据包，适用于 **Java 1.26.1**。

## 特性

- **3阶段战斗** — 虚空觉醒 → 水晶之怒 → 终焉灾变
- **7种攻击技能** — 虚空斩、裂隙弹幕、虚空光矛、魂火群、陨石雨、重力井、虚空引导
- **轨道水晶** — 3颗水晶环绕Boss旋转，随阶段碎裂
- **虚空之刃** — 10格攻击距离，5点穿甲虚空伤害
- **仪式召唤** — 合成虚空之心，右键方块召唤
- **4件掉落实物** — 虚空之心、虚空碎片、虚空掠夺者（剑）、虚空行者之靴

## 快速开始

1. [下载最新 Release](https://github.com/gggiz/aetherax/releases) 中的 `aetherax.zip`
2. 放入存档的 `datapacks/` 文件夹
3. 游戏中 `/reload` 或重新进入存档
4. `/trigger aetherax_spawn set 1` 召唤 Boss

## 召唤方式

### 命令召唤
```
/trigger aetherax_spawn set 1
```

### 仪式召唤
1. 合成虚空之心（下界之星 + 末影水晶 + 哭曜石）
2. 将虚空之心放在黑曜石上召唤

## 掉落物

| 物品 | 概率 | 说明 |
|------|------|------|
| 虚空之心 | 100% | 史诗下界之星，主手/副手持有时获得虚空之力 |
| 虚空碎片 | 100% | 3-6个，紫水晶材质 |
| 虚空掠夺者 | 35% | 锋利6+横扫3 史诗下界合金剑 |
| 虚空行者之靴 | 35% | 保护5+摔落保护6 下界合金靴子 |
| 宇宙精华 | 40% | 带粒子拖尾的回声碎片 |
| 经验瓶 | 100% | 30-50瓶 + 500经验 |

## 文件结构

```
aetherax/
├── pack.mcmeta
├── data/
│   ├── minecraft/tags/function/
│   │   ├── tick.json
│   │   └── load.json
│   └── aetherax/
│       ├── function/
│       │   ├── tick.mcfunction
│       │   ├── load.mcfunction
│       │   ├── summon.mcfunction
│       │   ├── boss/          # AI、阶段、死亡等
│       │   ├── attacks/       # 7种攻击技能
│       │   ├── effects/       # 粒子特效
│       │   ├── items/         # 虚空之刃、虚空之心等
│       │   ├── minions/       # 魂火小怪AI
│       │   └── loot/          # 战利品授予
│       ├── advancement/
│       ├── loot_table/
│       └── recipe/
```

## 许可

MIT License
