// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {JB721TierConfig} from "@bananapus/721-hook/src/structs/JB721TierConfig.sol";
import {JB721TiersHook} from "@bananapus/721-hook/src/JB721TiersHook.sol";

import "./helpers/BannyverseDeploymentLib.sol";
import "@rev-net/core/script/helpers/RevnetCoreDeploymentLib.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {Script} from "forge-std/Script.sol";

contract Drop1Script is Script, Sphinx {
    /// @notice tracks the deployment of the revnet contracts for the chain we are deploying to.
    RevnetCoreDeployment revnet;
    /// @notice tracks the deployment of the bannyverse contracts for the chain we are deploying to.
    BannyverseDeployment bannyverse;

    JB721TiersHook hook;
    address reserveBeneficiary;

    function configureSphinx() public override {
        // TODO: Update to contain revnet devs.
        sphinxConfig.projectName = "banny-core";
        sphinxConfig.mainnets = ["ethereum", "optimism", "base", "arbitrum"];
        sphinxConfig.testnets = ["ethereum_sepolia", "optimism_sepolia", "base_sepolia", "arbitrum_sepolia"];
    }

    function run() public {
        reserveBeneficiary = safeAddress();

        // Get the deployment addresses for the revnet contracts for this chain.
        revnet = RevnetCoreDeploymentLib.getDeployment(
            vm.envOr("REVNET_CORE_DEPLOYMENT_PATH", string("node_modules/@rev-net/core/deployments/"))
        );

        // Get the deployment addresses for the 721 hook contracts for this chain.
        bannyverse =
            BannyverseDeploymentLib.getDeployment(vm.envOr("BANNYVERSE_CORE_DEPLOYMENT_PATH", string("deployments/")));

        // Get the hook address by using the deployer.
        hook = JB721TiersHook(address(revnet.basic_deployer.tiered721HookOf(bannyverse.revnetId)));
        deploy();
    }

    function deploy() public sphinx {
        string[] memory names = new string[](47);
        bytes32[] memory svgHashes = new bytes32[](47);

        // Desk
        names[0] = "Work Station";
        svgHashes[0] = bytes32(0xab22e30cb6daaac109ea557a14af9b65f680d46cc563a0b25dd42483f9286bf7);
        // Hay field
        names[1] = "Hay Field";
        svgHashes[1] = bytes32(0x62f97f668e227ab9d6eaf5bd35504974f3df175ee2d952c39add59b7d141c0de);
        // Pew pew
        names[2] = "Pew Pew";
        svgHashes[2] = bytes32(0x71f6918188cd0bc9eb1d5baed9340491efb41af1d358bbeb10912a02e95323f8);
        // Bandolph staff
        names[3] = "Bandolph Staff";
        svgHashes[3] = bytes32(0x790e607150e343fd457bb0cefe5fd12cd216b722dabfa19adbee1f1e537fd1c7);
        // Block chain
        names[4] = "Block Chain";
        svgHashes[4] = bytes32(0x5e609d387ea091bc8884a753ddd28dd43b8ed1243b29de6e9354ef1ab109a0b9);
        // Astronaut Head
        names[5] = "Astronaut Head";
        svgHashes[5] = bytes32(0x7054504d4eef582f2e3411df719fba9d90e94c2054bf48e2efa175b4f37cc1e9);
        // Nerd
        names[6] = "Nerd Glasses";
        svgHashes[6] = bytes32(0x964356f8cbc40b81653a219d94da9d49d0bd5b745aa6bf4db16a14aa81c129ac);
        // Banny vision pro
        names[7] = "Banny Vision Pro";
        svgHashes[7] = bytes32(0x12702d5d843aff058610a01286446401be4175c27abaaec144d8970f99db34e2);
        // Cyberpunk glasses
        names[8] = "Cyberpunk Glasses";
        svgHashes[8] = bytes32(0x5930f0bb8cb34d82b88a13391bcccf936e09be535f2848ba7911b2a98615585d);
        // Investor shades
        names[9] = "Investor Shades";
        svgHashes[9] = bytes32(0x4410654936785cff70498421a8805ad2f9d5101a8c18168264ef94df671db10e);
        // Proff glasses
        names[10] = "Proff Glasses";
        svgHashes[10] = bytes32(0x54004065d83ca03befdf72236331f5b532c00920613d8774ebd8edbf277c345a);
        // Gap tooth
        names[11] = "Gap Teeth";
        svgHashes[11] = bytes32(0x5b5a29873435b40784f64c5d9bb5d95ecebd433c57493e38f3eb816a0dd9fd7f);
        // Dorthy shoes
        names[12] = "Dorthy Shoes";
        svgHashes[12] = bytes32(0x67a973e1023d2a9a37270e4345f9e93b30828ec64bc81c0d1d56028f8e976491);
        // Astronaut boots
        names[13] = "Astronaut Boots";
        svgHashes[13] = bytes32(0x539f9417dd22ba8aacd4029753f6058b5f905eef2a3b07acb519c964fc57ce50);
        // Flops
        names[14] = "Flops";
        svgHashes[14] = bytes32(0x0a322735b4b89b7a593a86615ccc03e14867ce1cfd57c1aa9a61a841d9498103);
        // Astronaut Body
        names[15] = "Astronaut Suit";
        svgHashes[15] = bytes32(0xdbcfc1891ab9d56cb964f3432f867a77293352e38edca3b59b34061e46a31b83);
        // Sweatsuit
        names[16] = "Sweatsuit";
        svgHashes[16] = bytes32(0xfbb3a6dde059e3e3115c3e83fd675d1739ec29afa62999fa759ed878f48e9aa2);
        // Dorthy dress
        names[17] = "Dorthy Dress";
        svgHashes[17] = bytes32(0xfc0eda6d0165d339239bfda3cf68d630949b03c588e3b6d45175c6fc8f00e289);
        // Geisha body
        names[18] = "Geisha Gown";
        svgHashes[18] = bytes32(0x5f8c77bc896a90a35580078ee7ea51460b5694aec68db3d749fd1dc0e9b05c6c);
        // Baggies
        names[19] = "Baggies";
        svgHashes[19] = bytes32(0x2f0cab70c7d07048ccc7b6855bba39cdd95be15a109c8eaa401d9be6d503ca2a);
        // Jonny utah shirt
        names[20] = "Jonny Utah Shirt";
        svgHashes[20] = bytes32(0xf62770cf77965461df8528baec000228c713e749b4dcc12e278b1025507dc0ff);
        // Doc coat
        names[21] = "Doc Coat";
        svgHashes[21] = bytes32(0x6650b989b4ad53d12fd306bf4a12f5afbca2072c3241fdcb96e434443039d1f7);
        // Goat jersey
        names[22] = "Goat Jersey";
        svgHashes[22] = bytes32(0xcca8b9f46f75822d78e7f3125ba4832e24ffe1711f6f01d00cdccb6669f752f2);
        // Irie tshirt
        names[23] = "Irie Shirt";
        svgHashes[23] = bytes32(0xd26b2eaad19396b85f4ae09c702717969b72b8c63021821e0d35addd85e7bbd1);
        // Punk jacket
        names[24] = "Punk Jacket";
        svgHashes[24] = bytes32(0x44cb972aab236c8c01afef7addb0f19a0fab02cfdc7b5065d662b53ab970f310);
        // Zipper jacket
        names[25] = "Zipper Jacket";
        svgHashes[25] = bytes32(0x7177dfec617d77cf78e8393fe373b68c7bc755edd1541c0decc952e99ec80304);
        // Zucco tshirt
        names[26] = "Zucco Tshirt";
        svgHashes[26] = bytes32(0x2a69ce643e565cb4fe648dc9b03020b0749ec780748d43153ee4c6770c76adbf);
        // Ice Cube
        names[27] = "Ice Cube";
        svgHashes[27] = bytes32(0x032b50792f9929066168187acd5eeb101f8528f538ef850913c81dc4b6452842);
        // Club beanie
        names[28] = "Club Beanie";
        svgHashes[28] = bytes32(0x0a8d7c8ff075db0e66638bb51eea732a53641b09b39de68d1cbeafe9099f9b6e);
        // Dorthy hair
        names[29] = "Dorthy Hair";
        svgHashes[29] = bytes32(0x5f2bec3082d7039474f6cba827a3fbd4d4f8e21f22d304edfbc6de77a8b529cf);
        // Farmer hat
        names[30] = "Farmer Hat";
        svgHashes[30] = bytes32(0xcf90bc8459345bcfae00796c4641c0bc8868c01d6339a54ef4d3c4fa1737cfd8);
        // Geisha hair
        names[31] = "Geisha Hair";
        svgHashes[31] = bytes32(0x17b939b04709c357480bdfa54cf2007d7898f4bf048bf12efa6cd8e3af4d711c);
        // Headphones
        names[32] = "Headphones";
        svgHashes[32] = bytes32(0xf1850876ede53102140881e04a4a0e532ba6a08bc0fb64dee279d11c98d64dbf);
        // Natty dread
        names[33] = "Natty Dred";
        svgHashes[33] = bytes32(0x04ae3342ce08da16f61d32e4ce7034dff0223e462afa48019b90c94afc19b939);
        // Peach hair
        names[34] = "Peach Hair";
        svgHashes[34] = bytes32(0xdf7b9e74c552908290a05388f905a503978a289c44ffb61e510df43f2955d435);
        // Proff hair
        names[35] = "Proff Hair";
        svgHashes[35] = bytes32(0x501769b2b47a8aedf4b328f6cf0076200df07ce2087f5e082f49e815f54595b9);
        // Catana
        names[36] = "Catana";
        svgHashes[36] = bytes32(0xbe7e7bb20da87fffa92e867bf0cd3267df180e24ba6eae7a1d434c56856ef2f5);
        // Chefs knife
        names[37] = "Chefs Knife";
        svgHashes[37] = bytes32(0x705180b5aee8e57d0a0783d22fc30dc95e3e84fac36e9d96fef96fabfa58d1f9);
        // Cheap beer
        names[38] = "Cheap Beer";
        svgHashes[38] = bytes32(0x993a2c657f43e19820f3e23677e650705d0c8c6a0ccd88a381aa54d2da7ba047);
        // Constitution
        names[39] = "Constitution";
        svgHashes[39] = bytes32(0xaf0826d8eac1e57789077f43e6f979488da6f619f72f9f0ff50a52ebcca3bfa3);
        // DJ Deck 
        names[40] = "DJ Deck";
        svgHashes[40] = bytes32(0x2c9538556986d134ddec2831e768233f587b242e887df9bb359b3aefffa3c5a6);
        // Gas can
        names[41] = "Gas Can";
        svgHashes[41] = bytes32(0x89808b70d019077e4f986b4a60af4ec15fc72ed022bc5e5476441d98f8ce1d1d);
        // Lightsaber
        names[42] = "Lightsaber";
        svgHashes[42] = bytes32(0xf7017a80e9fa4c3fc052a701c04374176620a8e5befa39b708a51293c4d8f406);
        // Potion
        names[43] = "Potion";
        svgHashes[43] = bytes32(0xefdbac65db3868ead1c1093ea20f0b2d77e9095567f6358e246ba160ec545e09);
        // Dagger
        names[44] = "Dagger";
        svgHashes[44] = bytes32(0xaf60de81f2609b847b7d6e97ef6c09c9e3d91cabe6f955bd8828f342f1558738);
        // Duct Tape
        names[45] = "Duct Tape";
        svgHashes[45] = bytes32(0x962ce657908ee4fb58b3e2d1f77109b36428e7a4446d6127bcb6c06aa2360637);
        // Wheat straw
        names[46] = "Wheat Straw";
        svgHashes[46] = bytes32(0x112b8217bb82aebc91e80c935244dce8aa30d4d8df5f98382054b97037dc0c94);

        uint256[] memory productIds = new uint256[](47);
        for (uint256 i; i < 47; i++) {
            productIds[i] = i + 5;
        }

        hook.setMetadata({
            baseUri: "",
            contractUri: "",
            tokenUriResolver: bannyverse.resolver,
            encodedIPFSTUriTierId: 0,
            encodedIPFSUri: bytes32(0)
        });
        bannyverse.resolver.setSvgHashsOf(productIds, svgHashes);
        bannyverse.resolver.setProductNames(productIds, names);
        bannyverse.resolver.setSvgBaseUri("https://bannyverse.infura-ipfs.io/ipfs/");
    }
}
